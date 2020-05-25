class VotesController < ApplicationController

  def create
    user = User.find_by(id: session[:user_id])
    work = Work.find_by(id: params[:work_id])
    vote = Vote.new(user: user, work: work)
        
    if vote.save
      flash[:success] = "Successfully upvoted!"
      redirect_to work_path(work.id)
      return
    else
      flash.now[:error] = "Something happened. Vote not added."
      render :new, status: :bad_request
      return
    end
  end
  
end
