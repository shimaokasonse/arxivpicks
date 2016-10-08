class LikesController < ApplicationController

  def create
    like = Like.create(create_params)
    @paper = like.comment.paper
    @comment = like.comment
    @like_count = like.comment.like_count
  end

  def destroy
    like = Like.find(params[:id])
    @comment = like.comment
    @paper = like.comment.paper
    @like_count = like.comment.like_count - 1
    like.destroy
  end

  private
  def create_params
    params.permit(:comment_id).merge(user_id: current_user.id)
  end

end
