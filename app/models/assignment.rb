class Assignment < ActiveRecord::Base
  belongs_to :userrole
  belongs_to :structure
end
