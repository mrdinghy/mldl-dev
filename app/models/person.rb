class Person < ActiveRecord::Base
  belongs_to :organization

  has_many :memberships, :dependent => :destroy
  has_many :structures, :through => :memberships

  has_many :participations, :dependent => :destroy
  has_many :meetings, :through => :participations

  has_many :disputants, :dependent => :destroy
  has_many :issues, :through => :disputants

  has_many :mediators, :dependent => :destroy
  has_many :mediations, :through => :mediators


  has_many :issues, :foreign_key => :raised_by

  extend EnumerateIt
  has_enumeration_for :gender


  #has_one :user

  def fullname
    if !self.salut.blank?
      fname = self.salut + " " + self.name_first
    else
      fname = self.name_first
    end
    if !self.suffix.blank?
      lname = self.name_last + " " + self.suffix
    else
      lname = self.name_last
    end
    fullname = fname + " " + lname
    return fullname
  end
end
