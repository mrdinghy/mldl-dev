class Issue < ActiveRecord::Base

  #validates :name, presence: true
  #validates :structure_id, presence: true
  #validates :district_id, presence: true
  #validates :community, presence: true


  belongs_to :structure
  belongs_to :district
  belongs_to :person, :foreign_key => :raised_by
  belongs_to :user, :foreign_key => :created_by
  belongs_to :category
  belongs_to :scope
  belongs_to :resolutiontype

  extend EnumerateIt
  has_enumeration_for :status

  has_many :disputants, :dependent => :destroy
  has_many :people, :through => :disputants

  has_many :agendas, :dependent => :destroy
  has_many :meetings, :through => :agendas

  has_many :actionstructures

  has_many :issueactions, :dependent => :destroy
  has_many :users, :through => :issueactions

  has_many :site_documents

  has_many :mediations



  def issuecode()
    short = self.structure.short

    meetingid = (short + '-'  + self.id.to_s)
    return meetingid

  end

  def issuestatus(status)
    puts 'YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY'
    puts status
    if status == Status::ONGOING
      vclass='ongoing'
    elsif status == Status::RESOLVED
      vclass='resolved'
    elsif status == Status::CANCELLED
      vclass='cancelled'
    elsif status == Status::MEDIATION
      vclass='mediation'
    elsif status == Status::NEW
      vclass='new'
    else
      vclass = 'default'
    end
    return vclass
  end


  def onagenda(meeting_id)

     findagenda = Issueaction.where('issue_id = ? and meeting_id = ? and actiontype = ?', self.id, meeting_id, Actiontype::AGENDA)

    if findagenda.count > 0
    return true
    else
      return false
    end

  end

  def resolved_year
  end

  def openmediation
    mediationchk = Mediation.where('issue_id =? and mediate_end is not NULL', self.id).count

      return mediationchk

  end






end
