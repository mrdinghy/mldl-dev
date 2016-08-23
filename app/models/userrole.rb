class Userrole < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
  belongs_to :structure

end
