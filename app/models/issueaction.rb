class Issueaction < ActiveRecord::Base
  belongs_to :issue
  belongs_to :meeting
  belongs_to :user
  belongs_to :structure
  belongs_to :mediation

  extend EnumerateIt
  has_enumeration_for :actiontype, create_helpers: true


end
