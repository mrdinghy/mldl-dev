class County < ActiveRecord::Base
  has_many :structures
  has_many :districts
end
