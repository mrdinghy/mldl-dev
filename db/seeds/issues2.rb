
Appissue.where('issueid in (?)', [501,363,176,177]).destroy_all
@cleanissues2 = Appissue.order('id')

@uniquemeetings = Appissue.select(:meetingcode, :originalmeetingdate, :structurecounty, :structuredistrict, :structure).order(:meetingcode).uniq

@uniquemeetings.each do |meet|


  s = self.newstructureid(meet.structurecounty, meet.structuredistrict, meet.structure)
  if s == 0 or s.nil?
    s = 1
  end
  m=Meeting.create(meeting_on: meet.originalmeetingdate, old_id: meet.meetingcode, structure_id: s)
end

#yourname column would be users in CSV so Ill leave that alone fon now
@cleanissues2.each do |issue|


  s = self.newstructureid(issue.structurecounty, issue.structuredistrict, issue.structure)
  cat = self.retcategory(issue.category)
  vuser = self.finduser(issue.yourname)
  d = self.retdist(issue.issuedistrict)
  scpe = self.retscope(issue.status)
  if !issue.resolutiontype.blank?
    rt = self.retrestype(issue.resolutiontype)
  else
    rt = 0
  end
  if s == 0 or s.nil? or s.blank?
    thisstructureid = 1
  else
    thisstructureid = s


  end
  if issue.issuename.blank?
    vname = 'No Issue Name Provided'
  else
    vname = issue.issuename
  end

  if issue.community.blank?
    vcommunity = 'No Community identified'
  else
    vcommunity = issue.community
  end
  if issue.report_ongoing.include? 'Resolve'
    if issue.resolutiondate.nil?
      rd= issue.originalmeetingdate
    else
      rd = issue.resolutiondate
    end
    vstatus = Status::RESOLVED
    vresult = Result::RESOLVED
  else
    vstatus = Status::ONGOING
    vstatus = Result::ONGOING
  end

  if cat == 0
    cat = nil
  end



  mldlissue = Issue.create(
      old_id: issue.id,
      structure_id: thisstructureid,
      scope_id: scpe,
      district_id: d,
      community: vcommunity,
      category_id: cat,
      description: issue.issuedescription,
      name: vname,
      originaltimestamp:issue.originaltimestamp,
      originaluser: issue.yourname,
      uuid: issue.uuid,
      actioncommittee: issue.actionplancommittee,
      actionplan: issue.actionplandescription,
      resolutiontype_id: rt,
      status: vstatus,
      resolution_date: rd)


  mldlissue.update_attributes(created_at:  issue.originalmeetingdate)


  thismeeting = Meeting.where('old_id = ?', issue.meetingcode).first

  # creates an Agenda action for each issues link to a meeting
  if thismeeting.nil?
    meetid=0
  else
    meetid=thismeeting.id
  end


  # all issues get an agenda and Resolved or Ongoing
  action = Issueaction.create(issue_id: mldlissue.id, actiontype: 2, user_id: vuser, meeting_id: meetid)
  if vresult == 5
    agenda = Agenda.create(issue_id: mldlissue.id, meeting_id: meetid, :addressed => true, result: Result::RESOLVED)
  else
    agenda = Agenda.create(issue_id: mldlissue.id, meeting_id: meetid, :addressed => true,  result: Result::ONGOING)
  end
  agenda.update_attributes!(created_at: issue.originalmeetingdate)


  if !issue.mediationdate.nil?
    if vresult == 5
      addmed = Mediation.create(issue_id: mldlissue.id, mediate_start: issue.mediationdate,  result: Result::RESOLVED)

    else
      addmed = Mediation.create(issue_id: mldlissue.id, mediate_start: issue.mediationdate, result: Result::ONGOING)
    end

    medaction=Issueaction.create(issue_id: mldlissue.id, actiontype: 7, user_id: vuser, mediation_id: addmed.id, actionbody: issue.mediationoutcome)
    medaction.update_attributes(created_at: issue.mediationdate)


    medaction.save!
  end
  if !issue.statusnotes.blank?
    statusnote = Issueaction.create(issue_id: mldlissue.id,actiontype: 3, actionbody: issue.statusnotes, user_id: vuser)

    if !issue.originalmeetingdate.nil?
      statusnote.update_attributes(created_at: issue.originalmeetingdate)
    else

      statusnote.update_attributes(created_at:  issue.originaltimestamp)
    end


  end

  if !issue.actionplannotes.blank?
    actplan = Issueaction.create(issue_id: mldlissue.id, actiontype: 3, actionbody: issue.actionplannotes, user_id: vuser)
    if !issue.originalmeetingdate.nil?
      actplan.update_attributes!(created_at: issue.originalmeetingdate)

    else

      actplan.update_attributes!(created_at:  issue.originaltimestamp)
    end

    #actplan.save!
  end

  if !issue.updatedescription.blank? and !issue.updatetype.nil?

    if issue.updatetype.include? 'Resolution'
      acttype=5
    elsif issue.updatetype.include? 'Referred'
      acttype=6

    elsif issue.updatetype.include? 'Mediation'
      acttype=7
    else
      acttype=3
    end

    updater = Issueaction.create(issue_id: mldlissue.id, actiontype: acttype, actionbody: issue.updatedescription, user_id: vuser)
    if !issue.updatedate.nil?
      updater.update_attributes(created_at: issue.originalmeetingdate)

    else
      updater.update_attributes(created_at:  issue.originaltimestamp)

    end
    #updater.save!
  end



end


