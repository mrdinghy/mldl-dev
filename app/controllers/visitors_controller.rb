 class VisitorsController < ApplicationController
  def index
    @latestissues = Issue.limit(12)
    @upcoming = Meeting.limit(6)
    @counties = County.all
    @structures = Structure.all

  end






 end
