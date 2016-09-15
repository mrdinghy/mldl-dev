class Manager < ActiveRecord::Base
  belongs_to :structure
  belongs_to :userrole
end
