class UsersController < ApplicationController
  def index
    @users = [{name: "katie", join_date: "sldkjfls"},
    {name: "louie", join_date: "aaaa"}]
  end

  def show
  end
end
