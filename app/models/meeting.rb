class Meeting < ActiveRecord::Base

  belongs_to :structure
  has_many :issueactions, :dependent => :destroy
  has_many :issues, :through => :issueactions

  has_many :participations, :dependent => :destroy
  has_many :people, :through => :participations


  has_many :site_documents

  extend TimeSplitter::Accessors
  split_accessor :real_start
  split_accessor :real_end



  def meetingid
    if !self.real_start.nil?
    yr = self.real_start.strftime("%Y").to_s
    mo = self.real_start.strftime("%m").to_s
    else
      yr = "????"
      mo = "??"
    end



    structure = self.structure.structuretype.code
    structurename = self.structure.name

    id= (yr + '-' + mo + '-' + structure[0,2] + '-'  + structurename + '-'  + self.id.to_s)
    return id
  end



  def status
    if self.meeting_held
      sname = 'Held'
    else
      sname = 'Scheduled'
    end
  end
end
