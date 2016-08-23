class Mediation < ActiveRecord::Base
  belongs_to :issue


  has_many :mediations, :dependent => :destroy
  has_many :people, :through => :mediations

end
