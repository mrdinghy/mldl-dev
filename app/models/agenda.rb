class Agenda < ActiveRecord::Base
  belongs_to :issue
  belongs_to :meeting
  belongs_to :user

  extend EnumerateIt
  has_enumeration_for :result, create_helpers: true


end
