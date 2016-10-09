class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @name = user.name
    @introduction = user.introduction
    @comments = Comment.where(user_id: params[:id]).order("created_at ASC")
  end

end
