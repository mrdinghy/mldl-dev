class Structure < ActiveRecord::Base
  has_many :meetings
  belongs_to :county
  belongs_to :district


  #enum structuretype: [ :cf, :dsc, :csc, :nsc ]
  extend EnumerateIt
  has_enumeration_for :structuretype, required: true, with: Structuretype


  has_many :memberships, :dependent => :destroy
  has_many :people, :through => :memberships
  accepts_nested_attributes_for :memberships, :reject_if => :all_blank, :allow_destroy => true

  #has_many :managers, :dependent => :destroy
  #has_many :userroles, :through => :managers


  def ismanager(thisuser)
    s = Manager.where('structure_id = ? and user_id =?', self.id, thisuser).count
    puts 'here is the odk========================='
    puts
    if s != 0
      return true
    else
      return false
    end
  end




  def current_meetings_held
    meetings = Meeting.where(:structure_id => self.id, :meeting_held => :true).count

    return meetings
  end






  def qmeetings(thisyear,thismonth,structure,held)
      all = Meeting.all
      all = all.where('structure_id = ?', structure)  if structure != 0
      all = all.where('extract(year from real_start) = ? and extract(month from real_start) = ?', thisyear, thismonth)     if thisyear != 0
      all = all.where('meeting_held is not NULL') if held != 0
    return all
  end


  def qissues(thisyear,thismonth,structure,district)

    all = Issue.all
    all = all.where('extract(year from created_at) = ? and extract(month from created_at) = ?', thisyear, thismonth)     if thisyear != 0
    all = all.where('structure_id = ?', structure)     if structure > 0
    all = all.where('district_id = ?', district)     if district > 0
    return all
    
  end


  def openissues(thisyear,thismonth,structure_id,district)
    qnumber = self.qissues(thisyear,thismonth,structure_id,district)
    qopen = qnumber.where('resolution_date is NULL and cancelled_at is NULL')
    return qopen
  end
  def resolvedissues(thisyear,thismonth,structure_id,district)
    qnumber = self.qissues(thisyear,thismonth,structure_id,district)
    qresolved = qnumber.where('resolution_date is NOT NULL')
    return qresolved
  end
  def cancelledissues(thisyear,thismonth,structure_id,district)
    qnumber = self.qissues(thisyear,thismonth,structure_id,district)
    qcancelled = qnumber.where('cancelled_at is NOT NULL and resolution_date is NULL')
    return qcancelled
  end







  def preissues(thisyear,thismonth,structure,district)
    alldata = Issue.where('(extract(year from created_at) = ? and  extract(month from created_at) < ?) OR extract(year from created_at) < ?', thisyear,thismonth,thisyear)
    alldata = alldata.where('resolution_date is NULL  OR (extract(year from resolution_date) = ? and extract(month from resolution_date) >= ?) OR extract(year from resolution_date) > ? ', thisyear, thismonth, thisyear)
    alldata = alldata.where('cancelled_at is NULL     OR (extract(year from cancelled_at) = ?    and extract(month from cancelled_at) >= ?)    OR extract(year from cancelled_at) > ? ', thisyear, thismonth, thisyear)

   alldata = alldata.where('structure_id = ?', structure)    if structure
   alldata = alldata.where('district_id = ?', district)  if district != 0
   return alldata
  end










  def maindata(thisyear, thismonth,structure, district, action, result, mediate)
    alldata = Issueaction.all
    alldata = alldata.where('extract(year from created_at) = ? and extract(month from created_at) = ?', thisyear, thismonth)  if thisyear !=0
    alldata = alldata.where('structure_id = ?', structure)    if structure != 0
    alldata = alldata.where('distrcit_id = ?', district)  if district != 0
    alldata = alldata.where('actiontype =?', action)   if action  != 0




    return alldata
  end




  def issues_agenda(thisyear,thismonth,structure_id)
    db_count = Issueaction.where('extract(year from created_at) = ? and extract(month from created_at) =? and actiontype_id = 2 and structure_id = ?', thisyear, thismonth,structure_id).count
    return db_count
  end


  def issues_escalated(thisyear,thismonth,structure_id)
    db_count = Issueaction.where('extract(year from created_at) = ? and extract(month from created_at) =? and actiontype_id in (5,12) and structure_id = ?', thisyear, thismonth,structure_id).count
    return db_count
  end

  def issues_mediated(thisyear,thismonth,structure_id)
    db_count = Issueaction.where('extract(year from created_at) = ? and extract(month from created_at) =? and actiontype_id in (11,16) and structure_id = ?', thisyear, thismonth,structure_id).count
    return db_count
  end


  def issues_mediation_success(thisyear,thismonth,structure_id)
    db_count = Issueaction.where('extract(year from created_at) = ? and extract(month from created_at) =? and actiontype_id in (6) and structure_id = ?', thisyear, thismonth,structure_id).count
    return db_count
  end


  def issues_cancelled(thisyear,thismonth,structure_id)
    db_count = Issueaction.where('extract(year from created_at) = ? and extract(month from created_at) =? and actiontype_id in (15,9) and structure_id = ?', thisyear, thismonth,structure_id).count
    return db_count
  end


  def issues_reopened(thisyear,thismonth,structure_id)
    db_count = Issueaction.where('extract(year from created_at) = ? and extract(month from created_at) =2 and actiontype_id in (10) and structure_id = ?', thisyear, thismonth,structure_id).count
    return db_count
  end







end
