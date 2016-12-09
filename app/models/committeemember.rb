class Committeemember < ActiveRecord::Base
  belongs_to :membership
  belongs_to :issue
end
