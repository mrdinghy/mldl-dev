class Quarter < ActiveRecord::Base




  def qtrname(q)

    if q == 1
      s='1st Qtr'
    elsif q == 4
      s='2nd Qtr'
    elsif q == 7
      s='3rd Qtr'
    elsif q == 10
      s='4th Qtr'
    else
      s='n/a'
    end
    return s
  end


  def q1234(q,y)
    if q == 1
      x='1st Qtr'
    elsif q == 4
      x= '2nd Qtr'
    elsif q == 7
      x= '3rd Qtr'
    elsif q == 10
      x= '4th Qtr'
    else
      x='na'
    end
    return y.to_s + '_' + x

  end

  def calcdate(q,y)
    d0= y.to_s + '-' + q.to_s + '-01 08:00:00:000000'
    d2= Time.parse(d0)
    return d2
  end


end
