class Issueaction < ActiveRecord::Base
  belongs_to :issue
  belongs_to :actiontype
  belongs_to :meeting


end
