class Issueaction < ActiveRecord::Base
  belongs_to :issue
  belongs_to :meeting
  belongs_to :user
  belongs_to :structure
  belongs_to :mediation

  extend EnumerateIt
  has_enumeration_for :actiontype, create_helpers: true



  def actiondesc(action)



    if action == Actiontype::CREATED
      str = 'New Issue Created'

    elsif action == Actiontype::AGENDA
      str = 'Issue on Agenda'

    elsif action == Actiontype::COMMENT
      str = 'Comment added'
    elsif action == Actiontype::ONGOING
      str = 'Issue not resolved'
    elsif action == Actiontype::RESOLVED
      str = 'Issue Resolved'
    elsif action == Actiontype::ESCALATED
      str = 'Issue Referred Up'
    elsif action == Actiontype::MEDIATION
      str = 'Send to Mediation'
    elsif action == Actiontype::CANCELLED
      str = 'Issue Cancelled'
    elsif action == Actiontype::REOPENED
      str = 'Issue Now Reopened'
    else
      str = ''
    end
    return str






  end











  def resolutiontype_id
  end




  def resolution
  end

  def resolution_date
  end

end
