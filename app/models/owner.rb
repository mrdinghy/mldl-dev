class Owner < ActiveRecord::Base
  belongs_to :person
  belongs_to :issue
end
