class Userrole < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
  has_many :managers, :dependent => :destroy



end
