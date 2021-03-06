class District < ActiveRecord::Base

  validates :name, presence: true
  has_many :issues
  #has_many :structures
  belongs_to :county

  has_many :issues_districts, :dependent => :destroy
  has_many :issues, :through => :issues_districts






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


  def allissuesdistricts(district_id)
    qq=Issue.where(:district_id => district_id)
    return qq
  end






     end
