 class VisitorsController < ApplicationController

   def index
    @latestissues = Issue.limit(12)
    @latestactivity = Issueaction.order('created_at DESC' ).limit(30)
    @upcoming = Meeting.limit(6)
    @countystructures = Structure.where('structuretype in (?)', [:nsc,:csc] ).order( 'structuretype_id DESC')
    @structures = Structure.all
    @counties = County.all
    @allcats = Category.all
    @alldistricts = District.all
    @yloop = [2013,2014,2015,2016]
    @qloop = [1,4,7,10]





      catsids = Category.order(:id)

      catlabels = ''
      cattotals = ''
      catsids.each do |c|

        calceach = Issue.where('category_id = ?', c.id).count
        if c.id == 10
          c1 = calceach.to_s
          c2 = '"' + c.name + '"'
        else
          c1 = calceach.to_s + ','
          c2 = '"' + c.name + '",'
        end
        cattotals = cattotals + c1
        catlabels = catlabels + c2
      end
      @catdata = cattotals
      @catlabels = catlabels

      resolved = ''
      issuedata = ''
      arrayx = [1,2,3,4,5,6,7,8]
      arrayx.each do |m|

          mcalc = self.qissues(2016,m,0,0).count
          if m == 8
             c1 = mcalc.to_s
          else
             c1 = mcalc.to_s + ','
          end
          issuedata = issuedata + c1

          rcalc = self.maindata(2016,m,0,0,35,0,0).count
          if m == 8
            r1 = rcalc.to_s
          else
            r1 = rcalc.to_s + ','
          end
          resolved = resolved + r1




     end
      @issuedata = issuedata
    @resolved = resolved


  #  @allissues= Issue.all
  #  @allnewissues = @allissues.where(:status => Status::NEW)
  #  @allongoingissues = @allissues.where(:status => Status::ONGOING)
  #  openids = [Status::ONGOING, Status::NEW, Status::MEDIATION]
  #  @allopenissues = @allissues.where(status: openids)

  #  @allmediationissues = @allissues.where(:status => Status::MEDIATION)
  #  @allresolvedissues = @allissues.where(:status => Status::RESOLVED)



   end



















   def qissues(thisyear,thismonth,structure,district)

      all = Issue.all
      all = all.where('extract(year from raised_on) = ? and extract(month from raised_on) = ?', thisyear, thismonth)     if thisyear != 0
      all = all.where('structure_id = ?', structure)     if structure > 0
      all = all.where('district_id = ?', district)     if district > 0
      return all

    end

   def resolvedissues(thisyear,thismonth,structure_id,district)
     qnumber = self.qissues(thisyear,thismonth,structure_id,district)
     qresolved = qnumber.where('resolution_date is NOT NULL')
     return qresolved
   end



   def maindata(thisyear, thismonth,structure, district, action, result, mediate)
     alldata = Issueaction.all
     alldata = alldata.where('extract(year from created_at) = ? and extract(month from created_at) = ?', thisyear, thismonth)  if thisyear !=0
     alldata = alldata.where('structure_id = ?', structure)    if structure != 0
     alldata = alldata.where('distrcit_id = ?', district)  if district != 0
     alldata = alldata.where('actiontype =?', action)   if action  != 0




     return alldata
   end







  def newpermonth(m,cat)
    newissues = Issue.where('extract(month from raised_on) = ?', m)
    return newissues.count



  end

  def actionreport
    @allstructures = Structure.order(:id)



    render 'activityreport'



  end



   def qtrname(q)
     if q == 1
       s='1st'
     elsif q == 4
       s='2nd'
     elsif q == 7
       s='3rd'
     elsif q == 10
       s='4th'
     else
       s='n/a'
     end
     return s
   end


   helper_method :qtrname







 end
