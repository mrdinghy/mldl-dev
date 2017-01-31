class IssuesDistrict < ActiveRecord::Base
  belongs_to :issue
  belongs_to :district
end
