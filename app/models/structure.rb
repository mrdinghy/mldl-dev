class Structure < ActiveRecord::Base
  has_many :meetings
  belongs_to :county
  belongs_to :district
  belongs_to :structuretype


  has_many :memberships, :dependent => :destroy
  has_many :people, :through => :memberships

  has_many :assignments, :dependent => :destroy
  has_many :usersroles, :through => :assignments







  def current_meetings_held(id)
    meetings = Meeting.where(:structure_id => id, :meeting_held => :true).count

    return meetings
  end

  def total_issues(id)
    total = Issue.where('structure_id = ?', id).count
    return total
  end

  def open_issues(id)
    open = Issue.where('structure_id = ? and resolution_date > ?', id, 10.years.ago).count
    return open
  end



  def resolved_issues(id)
    resolved = Issue.where('structure_id = ? and resolution_date IS NULL', id).count
    return resolved
  end
  def percent_resolved(id)
    if self.total_issues(id) > 0
      resolvedpct = (self.resolved_issues(id).to_f / self.total_issues(id).to_f) * 100
      #total = Issue.where('structure_id = ?', id).count
      #resolved = Issue.where('structure_id = ? and resolution_date IS NULL', id).count
      #resolvedpct = resolved / total
      puts '===============================dfadsfasdf=============================='
      puts 'total :', self.total_issues(id)
      puts 'resolved: ', self.resolved_issues(id)

      puts resolvedpct
      puts '===============================dfadsfasdf=============================='
      return resolvedpct
    else
      return 0
    end

  end
















end
