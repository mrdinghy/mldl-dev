class Membership < ActiveRecord::Base
  belongs_to :person
  belongs_to :structure



  has_many :committeemembers, :dependent => :destroy
  has_many :issues, :through => :committeemembers


end
