class Project < ActiveRecord::Base
  has_many :structures


  def qstart(d2)
    q= d2.beginning_of_quarter.to_date
  end
  def qend(d2)
    q= d2.end_of_quarter.to_date
  end

  def qmonths(d2)
    q1st=qstart(d2).month
    q2nd=q1st + 1
    q3rd=q2nd + 1
    montharray=[q1st,q2nd,q3rd]
    return montharray
  end
  def qtrname(q)

    if q == 1
      s='1st Qtr'
    elsif q == 4
      s='2nd Qtr'
    elsif q == 7
      s='3rd Qtr'
    elsif q == 10
      s='4th Qtr'
    else
      s='n/a'
    end
    return s
  end


  def showmonth
    if m == 1
      mn = 'January'



    end







  end


  def allbystatus(status,s1,cat,dist)

    searchresults = Issue.all
    if status !=0
      searchresults = searchresults.where(status: status)
    end
    if s1 != 0
      searchresults = searchresults.where(structure_id: s1)
    end
    if cat !=0
      searchresults = searchresults.where(category_id: cat)
    end
    if dist !=0
      searchresults = searchresults.where(district_id: dist)
    end
    return searchresults
  end

def percentresolved(total,resolved)
  if total == 0
    pct = 0
  else
  pct = ((resolved.to_f / total.to_f) * 100)
  end

  return pct


end



  #grab all issues for one qtr (s1=0) or by structure (s1-n)
  def quarter_issues(d2,s1,cat,dist)

    all = Issue.where('extract(year from created_at) = ?', self.qstart(d2).year)
    number = all.where('extract(month from created_at) in (?)', self.qmonths(d2))
    if s1 != 0
      number = number.where('structure_id in (?)', s1)
    end
    if cat !=0
      number = number.where(category_id: cat)
    end
    if dist !=0
      number = number.where(district_id: dist)
    end
    return number
  end


  def beginissues(d2,s1,cat,dist)
    #qset = quarter_issues(d2,s1)
    qresult = Issue.where('created_at < ?', self.qstart(d2))
    qresult = qresult.where('resolution_date >= ? or resolution_date is null', d2)
    qresult = qresult.where('cancelled_at >= ? or cancelled_at is NULL', d2)
    if s1 != 0
      qresult = qresult.where('structure_id in (?)', s1)
    end
    if cat !=0
      qresult = qresult.where(category_id: cat)
    end
    if dist !=0
      qresult = qresult.where(district_id: dist)
    end

    return qresult
  end
  def totalopen(d2,s1,cat, dist)
    calc = self.beginissues(d2,s1,cat,dist) + self.quarter_issues(d2,s1,0,0)
    return calc

  end


  def currentopen(d2,s1,cat,dist)

    qresult = Issue.where('(status = ? or status = ?)',  Status::NEW, Status::ONGOING)

    if s1 != 0
      qresult = qresult.where('structure_id in (?)', s1)
    end
    if cat !=0
      qresult = qresult.where(category_id: cat)
    end
    if dist !=0
      qresult = qresult.where(district_id: dist)
    end




    return qresult

  end




  def cumulative_issues(d2,s1,cat,dist)
    qresult = Issue.all
    if d2 != 0
      qresult = qresult.where('created_at < ?', self.qstart(d2))

    end

    if s1 != 0
      qresult = qresult.where('structure_id in (?)', s1)
    end
    if cat !=0
      qresult = qresult.where(category_id: cat)
    end
    if dist !=0
      qresult = qresult.where(district_id: dist)
    end

    return qresult
  end




  def quarter_resolved(d2,s1,cat,dist)

    qresult = Issue.where('resolution_date >= ? and resolution_date <= ?', self.qstart(d2), self.qend(d2))
    if s1 != 0
      qresult = qresult.where('structure_id in (?)', s1)
    end
    if cat !=0
      qresult = qresult.where(category_id: cat)
    end
    if dist !=0
      qresult = qresult.where(district_id: dist)
    end
    return qresult
  end


  def total_resolved(s1,cat,dist)
    qresult = Issue.where('resolution_date is not NULL')
    if s1 != 0
      qresult = qresult.where('structure_id in (?)', s1)
    end
    if cat !=0
      qresult = qresult.where(category_id: cat)
    end
    if dist !=0
      qresult = qresult.where(district_id: dist)
    end
    return qresult
  end

  def cumulative_resolved(d2,s1,cat,dist)
    if d2 != 0
    qresult = Issue.where('resolution_date <= ?', self.qend(d2))
    end
    if s1 != 0
      qresult = qresult.where('structure_id in (?)', s1)
    end
    if cat !=0
      qresult = qresult.where(category_id: cat)
    end
    if dist !=0
      qresult = qresult.where(district_id: dist)
    end
    return qresult
  end




  def meetings(d2,s1,cat,dist)
    qresult = Meeting.all
    if d2 != 0
    qresult = qresult.where('extract(year from meeting_on) = ?', self.qstart(d2).year)
    qresult = qresult.where('extract(month from meeting_on) in (?)', self.qmonths(d2))
    end

    if s1 != 0
      qresult = qresult.where('structure_id in (?)', s1)
    end

    return qresult
  end



  def get_agendas(d2,s1,cat,dist)

    qresult = Meeting.all
    if d2 != 0
        qresult = qresult.where('extract(year from meeting_on) = ?', self.qstart(d2).year)
        qresult = qresult.where('extract(month from meeting_on) in (?)', self.qmonths(d2))
    end

    if s1 != 0
      qresult = qresult.where('structure_id in (?)', s1)
    end
    meetingids = qresult.pluck(:id)
    qresult = AgendaMeeting.where(meeting_id: meetingids)

    return qresult
  end



  def old_get_agendas(d2,s1,cat,dist)

    qresult = AgendaMeeting.where('extract(year from created_at) = ?', self.qstart(d2).year)
    qresult = qresult.where('extract(month from created_at) in (?)', self.qmonths(d2))

    if s1 != 0
      qresult = qresult.where('structure_id in (?)', s1)
    end
    if cat !=0
      qresult = qresult.where(category_id: cat)
    end
    if dist !=0
      qresult = qresult.where(district_id: dist)
    end

    return qresult
  end


  def agenda_results(d2,s1,r1,cat,dist)

    qresult = Meeting.all
    if d2 != 0
      qresult = qresult.where('extract(year from meeting_on) = ?', self.qstart(d2).year)
      qresult = qresult.where('extract(month from meeting_on) in (?)', self.qmonths(d2))
    end

    if s1 != 0
      qresult = qresult.where('structure_id in (?)', s1)
    end
    meetingids = qresult.pluck(:id)
    qresult = AgendaMeeting.where(meeting_id: meetingids)

    qresult = qresult.where(result: r1)

    if cat !=0
      qresult = qresult.where(category_id: cat)
    end
    if dist !=0
      qresult = qresult.where(district_id: dist)
    end
    return qresult
  end


  def mediation_starts(d2,s1,cat,dist)
    qresult = MediationIssue.all
    if d2 != 0
      qresult = qresult.where('extract(year from mediate_start) = ?', self.qstart(d2).year)
      qresult = qresult.where('extract(month from mediate_start) in (?)', self.qmonths(d2))

    end

    if s1 != 0
      qresult = qresult.where('structure_id in (?)', s1)
    end
    if cat !=0
      qresult = qresult.where(category_id: cat)
    end
    if dist !=0
      qresult = qresult.where(district_id: dist)
    end
    return qresult
  end



  def mediation_ends(d2,s1,cat,dist)

    qresult = MediationIssue.all
    if d2 != 0
      qresult = qresult.where('extract(year from mediate_end) = ?', self.qstart(d2).year)
      qresult = qresult.where('extract(month from mediate_end) in (?)', self.qmonths(d2))

    end
    if s1 != 0
      qresult = qresult.where('structure_id in (?)', s1)
    end
    if cat !=0

      qresult = qresult.where(category_id: cat)
    end
    if dist !=0
      qresult = qresult.where(district_id: dist)
    end
    return qresult
  end


  def mediation_results(d2,s1,r1,cat,dist)
    if d2 != 0
    qresult = MediationIssue.where('extract(year from mediate_end) = ?', self.qstart(d2).year)
    qresult = qresult.where('extract(month from mediate_end) in (?)', self.qmonths(d2))
    end
    if r1
      qresult = qresult.where(result: r1)
    end
    if s1 != 0
      qresult = qresult.where('structure_id in (?)', s1)
    end
    if cat !=0
      qresult = qresult.where(category_id: cat)
    end
    if dist !=0
      qresult = qresult.where(district_id: dist)
    end
    return qresult
  end



  def openmediations(d2,s1)
    qresult = MediationIssue.where('mediation_held is null')
    if d2 != 0
    qresult = qresult.where('extract(year from mediate_end) = ?', self.qstart(d2).year)
    qresult = qresult.where('extract(month from mediate_end) in (?)', self.qmonths(d2))
    end
    if s1 != 0
      qresult = qresult.where('structure_id in (?)', s1)
    end
    return qresult
  end




  def quarter_issue_total(d2,s1,cat,dist)
    number = self.quarter_issues(d2,s1,cat,dist).count
    return number
  end

  def beginissues_total(d2,s1,cat,dist)
    number = self.beginissues(d2,s1,cat,dist).count
    return number
  end

  def quarter_agenda_total(d2,s1,cat,dist)
    number = self.quarter_agendas(d2,s1,cat,dist).count
    return number
  end

  def quarter_issue_resolved(d2,s1,cat,dist)
    number = self.quarter_resolved(d2,s1,cat,dist).count
    return number

  end



def monthreport(country,monthstart)



end
def monthnew(monthstart,s1,sids)
  monthend = monthstart.end_of_month
  mresult = Issue.all
  mresult = mresult.where('extract(year from created_at) = ?', monthstart.year)
  mresult = mresult.where('extract(month from created_at) = ?',monthstart.month)
  if s1 != 0
    mresult = mresult.where(structure_id: s1)
  else
    mresult = mresult.where('structure_id in (?)', sids)
  end
  return mresult
end

  def monthtotalbegin(monthstart,s1,sids,resolved)
    monthend = monthstart.end_of_month
    mresult = Issue.all
    mresult = mresult.where('created_at < ?', monthstart)
    if resolved != 0
       mresult = mresult.where('resolution_date >= ? or resolution_date is null', monthstart)
    end


    if s1 != 0
      mresult = mresult.where(structure_id: s1)
    else
      mresult = mresult.where('structure_id in (?)', sids)
    end
    return mresult
  end



  def monthmeetings(monthstart,s1,sids)
    monthend = monthstart.end_of_month
    mresult = Meeting.all
    mresult = mresult.where('extract(year from meeting_on) = ?', monthstart.year)
    mresult = mresult.where('extract(month from meeting_on) = ?',monthstart.month)

    if s1 != 0
      mresult = mresult.where(structure_id: s1)
    else
      mresult = mresult.where('structure_id in (?)', sids)
    end
    return mresult
  end


  def monthagendas(monthstart,s1,sids)
    monthend = monthstart.end_of_month
    mresult = Meeting.all
    mresult = mresult.where('extract(year from meeting_on) = ?', monthstart.year)
    mresult = mresult.where('extract(month from meeting_on) = ?',monthstart.month)

    if s1 != 0
      mresult = mresult.where(structure_id: s1)
    else
      mresult = mresult.where('structure_id in (?)', sids)
    end
    meetingids = mresult.pluck(:id)
    agendas = Agenda.where(meeting_id: meetingids)

    return agendas
  end


  def monthmediationsstart(monthstart,s1,sids)
    monthend = monthstart.end_of_month
    mresult = MediationIssue.all
    mresult = mresult.where('extract(year from mediate_start) = ?', monthstart.year)
    mresult = mresult.where('extract(month from mediate_start) = ?',monthstart.month)
    if s1 != 0
      mresult = mresult.where(structure_id: s1)
    else
      mresult = mresult.where('structure_id in (?)', sids)
    end
    return mresult
  end


  def monthmediationsend(monthstart,s1,sids)
    monthend = monthstart.end_of_month
    mresult = MediationIssue.all
    mresult = mresult.where('extract(year from mediate_end) = ?', monthstart.year)
    mresult = mresult.where('extract(month from mediate_end) = ?',monthstart.month)
    if s1 != 0
      mresult = mresult.where(structure_id: s1)
    else
      mresult = mresult.where('structure_id in (?)', sids)
    end
    return mresult
  end

  def monthissuesresolved(monthstart,s1,sids)
    monthend = monthstart.end_of_month
    mresult = Issue.all
    mresult = mresult.where('extract(year from resolution_date) = ?', monthstart.year)
    mresult = mresult.where('extract(month from resolution_date) = ?',monthstart.month)
    if s1 != 0
      mresult = mresult.where(structure_id: s1)
    else
      mresult = mresult.where('structure_id in (?)', sids)
    end
    return mresult
  end


  def endmonthresolved(monthstart,s1,sids)
    monthend = monthstart.end_of_month
    mresult = Issue.where('resolution_date is not NULL')
    mresult = Issue.where('resolution_date <= ?', monthend)
      if s1 != 0
      mresult = mresult.where(structure_id: s1)
    else
      mresult = mresult.where('structure_id in (?)', sids)
    end
    return mresult
  end




  def infopoptitle(code)
    vpop = Infopopup.find_by_code(code)
    if vpop.nil?
      return 'n/a'
    else

      return vpop.title
    end

  end
  def infopopbody(code)
    vpop = Infopopup.find_by_code(code)
    if vpop.nil?
      return 'n/a'
    else

      return vpop.body
    end

  end



























end
