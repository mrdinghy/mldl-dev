class Consideration < ActiveRecord::Base
  belongs_to :meeting
  belongs_to :issue
end
