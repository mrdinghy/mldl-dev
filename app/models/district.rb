class District < ActiveRecord::Base
  has_many :issues
  has_many :structures







  def calctotal
    total = Issue.where('district_id = ?', self.id).count
    return total
  end

  def open_issues
    open = Issue.where('district_id = ? and resolution_date > ?', self.id, 10.years.ago).count
    return open
  end

  def percent_resolved
    if self.calctotal > 0
      resolvedpct = (self.calcresolved.to_f / self.calctotal.to_f) * 100
      return resolvedpct
    else
      return 0
    end

  end



  def calcopen
    q=Issue.where('district_id =? and resolution_date  is NULL', self.id).count
    return q
  end



  def calcresolved
    q=Issue.where('district_id =? and resolution_date  is  not NULL', self.id).count
    return q
  end







     end
