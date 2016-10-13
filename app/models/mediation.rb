class Mediation < ActiveRecord::Base
  belongs_to :issue


  has_many :mediatior, :dependent => :destroy
  has_many :people, :through => :mediatiors


  extend EnumerateIt
  has_enumeration_for :result, create_helpers: true

  def mediationcode()
    issue = self.issue

    id= ('MED-' + self.id.to_s + '-' + self.issue.issuecode)
    return id
  end




end
