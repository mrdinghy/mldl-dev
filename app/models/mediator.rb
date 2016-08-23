class Mediator < ActiveRecord::Base
  belongs_to :person
  belongs_to :mediation
end
