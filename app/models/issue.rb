class Issue < ActiveRecord::Base
  belongs_to :structure
  belongs_to :district
  belongs_to :person, :foreign_key => :raised_by
  belongs_to :user, :foreign_key => :created_by
  belongs_to :category
  belongs_to :status
  belongs_to :scope
  has_many :issueactions, :dependent => :destroy
  has_many :meetings, :through => :issueactions
  has_many :site_documents



  def issueid
    structure = self.structure.structuretype.code
    structurename = self.structure.name

    id= (structure[0,2] + '-'  + structurename + '-' + self.id.to_s )
    return id
  end



  def onagenda(meeting_id)
    puts '888888888888888888888888888888888888'
     findagenda = Issueaction.where('issue_id = ? and meeting_id = ? and actiontype_id = ?', self.id, meeting_id, 2)
    if findagenda.count > 0
    return true
    end

  end


end
