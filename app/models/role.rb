class Role < ActiveRecord::Base

  has_many :userroles, :dependent => :destroy
  has_many :users, :through => :userroles
  has_many :structures, :through => :userroles

end
