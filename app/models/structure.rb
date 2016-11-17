class Structure < ActiveRecord::Base
  has_many :meetings
  belongs_to :county
  belongs_to :district
  belongs_to :project


  #enum structuretype: [ :cf, :dsc, :csc, :nsc ]
  extend EnumerateIt
  has_enumeration_for :structuretype, required: true, with: Structuretype


  has_many :memberships, :dependent => :destroy
  has_many :people, :through => :memberships
  accepts_nested_attributes_for :memberships, :reject_if => :all_blank, :allow_destroy => true

  #has_many :managers, :dependent => :destroy
  #has_many :userroles, :through => :managers





  def getdistricts(county_id)
    dscs = Structure.where(county_id: county_id, structuretype: Structuretype::DSC )
    return dscs
  end
  def getcfs(district_id)
    dscs = Structure.where(district_id: district_id, structuretype: Structuretype::CF )
    return dscs
  end





  def ismanager(thisuser)
    s = Manager.where('structure_id = ? and user_id =?', self.id, thisuser).count
    puts 'here is the odk========================='
    puts s
    if s != 0
      return true
    else
      return false
    end
  end


  def ourissues()
    myissues= Issue.where(structure_id: self.id).order('created_at DESC')
    return myissues
  end

  def ournewissues()
    q= self.ourissues()
    qq=q.where(:status => Status::NEW)
    return qq
  end
  def ourongoingissues()
    q= self.ourissues()
    qq=q.where(:status => Status::ONGOING)
    return qq
  end

  def ouropenissues()
    q= self.ourissues()
    openids = [Status::ONGOING, Status::NEW, Status::MEDIATION]
    puts '=====================openids========================='
    puts openids
    qq=q.where(status: openids)

    return qq
  end
  def ourmediationissues()
    q= self.ourissues()
    qq=q.where(:status => Status::MEDIATION)
    return qq
  end
  def ourresolvedissues()
    q= self.ourissues()
    qq=q.where(:status => Status::RESOLVED)
    return qq
  end

  def ourcancelledissues()
    q= self.ourissues()
    qq=q.where(:status => Status::CANCELLED)
    return qq
  end




  def ourissuescategories(category_id)
    q= self.ourissues()
    qq=q.where(:category_id => category_id)
    return qq
  end

  def ourissuesdistricts(district_id)
    q= self.ourissues()
    qq=q.where(:district_id => district_id)
    return qq
  end



  def ourmeetings()
    q= self.ourissues()
    meetings = Meeting.where(:structure_id => self.id)
    return meetings
  end


  def meetingsheld
    meetings = Meeting.where(:structure_id => self.id, :meeting_held => :true).count

    return meetings
  end
  def upcomingmeetings
    meetings = Meeting.where(:structure_id => self.id, :meeting_held => :true).count

    return meetings
  end


  def firstissue
    mldlstart = Issue.select(:created_at).order(:created_at)
    return mldlstart.first.created_at
  end
def lastissue
  mldlstart = Issue.select(:created_at).order(:created_at)
  return mldlstart.last.created_at

end

  def quarter_prioropen(d2,s1)
    qstart= d2.beginning_of_quarter
    qlast= d2.end_of_quarter
    qmonth1 = qstart.month
    qmonth2 = qmonth1 + 1
    qmonth3 = qmonth1 + 2
    all = Issue.where('created_at < ?', qstart)
    all2 = all.where('resolution_date >= ? or resolution_date is null', qstart)
    all3 = all2.where('cancelled_at >= ? or cancelled_at is NULL', qstart)
    if s1 != 0
      all3 = all3.where(structure_id: s1)
    end

    number =  all3.count
    return number
  end






  def quarter_agenda_resolved(d2,s1)
    all = self.quarter_agendas(d2,s1)
    number = all.where(status: Result::RESOLVED).count
    return number
    return all
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
    qopen = qnumber.where('status = ? OR status = ?', Status::ONGOING, Status::NEW  )
    return qopen
  end

  def openmeetings(thisyear,thismonth,structure_id,district)
    qnumber = self.qmeetings(thisyear,thismonth,structure_id,district)
    qopen = qnumber.where('meeting_held is NULL')
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



def listmanagers(structure_id)
  q = Manager.where(structure_id: structure_id)
  return q
end




end
