class Meeting < ActiveRecord::Base

  belongs_to :structure
  #has_many :issueactions, :dependent => :destroy

  has_many :agendas, :dependent => :destroy
  has_many :issues, :through => :agendas

  has_many :participations, :dependent => :destroy
  has_many :people, :through => :participations


  has_many :site_documents


  def meetingid

    mdate = self.meeting_on.strftime("%Y-%m").to_s
    structure = self.structure.short
    structurename = self.structure.name

    meetingid = ('MTG ' + mdate + '-' + structure + '-'  + self.id.to_s)
    return meetingid
  end



  def status
    if self.meeting_held
      sname = 'Held'
    else
      sname = 'Scheduled'
    end
  end
end
