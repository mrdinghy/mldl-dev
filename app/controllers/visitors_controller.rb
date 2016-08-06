 class VisitorsController < ApplicationController
  def index
    @latestissues = Issue.limit(12)
    @upcoming = Meeting.limit(6)
    @countystructures = Structure.where('structuretype_id in (?)', [4,3]).order( 'structuretype_id DESC')
    @structures = Structure.all
    @counties = County.all

  end






 end
