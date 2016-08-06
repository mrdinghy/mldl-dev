class Structure < ActiveRecord::Base
  has_many :meetings
  belongs_to :county
  belongs_to :district
  belongs_to :structuretype


  has_many :memberships, :dependent => :destroy
  has_many :people, :through => :memberships

  has_many :assignments, :dependent => :destroy
  has_many :usersroles, :through => :assignments







  def current_meetings_held
    meetings = Meeting.where(:structure_id => self.id, :meeting_held => :true).count

    return meetings
  end

  def calctotal
    total = Issue.where('structure_id = ?', self.id).count
    return total
  end


  def percent_resolved
    if self.calctotal > 0
      resolvedpct = (self.calcresolved.to_f / self.calctotal.to_f) * 100
      return resolvedpct
    else
      return 0
    end

  end



def calcmeets
  q=Meeting.where('structure_id =?', self.id).count
  return q
end


  def calcopen
    q=Issue.where('structure_id =? and resolution_date  is NULL', self.id).count
    return q
  end


  def calcescalated
    q=Issueaction.where('structure_id =? and actiontype_id = ?', self.id, 5).count
    return q
  end

  def calcresolved
    q=Issue.where('structure_id =? and resolution_date  is  not NULL', self.id).count
    return q
  end







end
