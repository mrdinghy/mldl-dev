class Role < ActiveRecord::Base

  has_many :userroles, :dependent => :destroy

end
