class SiteDocument < ActiveRecord::Base
  translates :name
  belongs_to :language
  has_attached_file :document
  belongs_to :issue
  belongs_to :meeting
end
