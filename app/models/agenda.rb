class Agenda < ActiveRecord::Base
  belongs_to :issue
  belongs_to :meeting

  extend EnumerateIt
  has_enumeration_for :result, create_helpers: true


end
