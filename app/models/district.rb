class District < ActiveRecord::Base
  has_many :issues
  has_many :structures
end
