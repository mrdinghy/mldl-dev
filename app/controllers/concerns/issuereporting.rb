module Issuereporting
  extend ActiveSupport::Concern


  included do
    helper_method :beginissues
  end

  def beginissues(d2,s1)
    qstart= d2.beginning_of_quarter
    qlast= d2.end_of_quarter
    qmonth1 = qstart.month
    qmonth2 = qmonth1 + 1
    qmonth3 = qmonth1 + 2
    all = Issue.where('created_at < ?', qstart)
    all2 = all.where('resolution_date >= ? or resolution_date is null', qstart)
    all3 = all2.where('cancelled_at >= ? or cancelled_at is NULL', qstart)
    if s1 != 0
      all3 = all3.where(structure_id: s1)
    end

    number =  all3.count
    return number
  end




end