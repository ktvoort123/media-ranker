class HomepagesController < ApplicationController
  def index
    @samp_work = Work.all.sort_by{|work| work.num_votes}.reverse[0]
    @albums = Work.where(category: "album").sort_by{|work| work.num_votes}.reverse[0..10]
    @movies = Work.where(category: "movie").sort_by{|work| work.num_votes}.reverse[0..10]
    @books = Work.where(category: "book").sort_by{|work| work.num_votes}.reverse[0..10]

  end
end
