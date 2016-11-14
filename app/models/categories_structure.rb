class CategoriesStructure < ActiveRecord::Base
  belongs_to :category
  belongs_to :structure
end
