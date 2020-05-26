class HomepagesController < ApplicationController

  def index
    @works = Work.all
    @top_work = @works.work_with_most_votes
  end
  
end
