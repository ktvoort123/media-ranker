class HomepagesController < ApplicationController
  def index
    @samp_work = Work.all.sample
    @albums = Work.where(category: "album")[0..10]
    @movies = Work.where(category: "movie")[0..10]
    @books = Work.where(category: "book")[0..10]

  end
end
