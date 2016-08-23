class Person < ActiveRecord::Base
  belongs_to :organization
  has_many :memberships, :dependent => :destroy
  has_many :structures, :through => :memberships

  has_many :participations, :dependent => :destroy
  has_many :meetings, :through => :participations



  has_many :mediators, :dependent => :destroy
  has_many :mediations, :through => :mediators


  has_many :issues, :foreign_key => :raised_by



  #has_one :user

  def fullname
    fullname = self.name_first + " " + self.name_last
    return fullname
  end
end
