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
    mdate = self.real_start.strftime("%F").to_s

    else
      mdate = "????"
    end

    structure = self.structure.structuretype.code
    structurename = self.structure.name

    meetingid = (mdate + '-' + structure[0,2] + '-'  + structurename)
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
