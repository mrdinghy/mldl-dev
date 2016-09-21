class Manager < ActiveRecord::Base
  belongs_to :structure
  belongs_to :user
end
