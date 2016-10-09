class CommentsController < ApplicationController

  def new
    @paper = Paper.find(params[:paper_id])
    @comment = Comment.new
  end

  def create
    Comment.create(create_params)
    redirect_to "/papers/#{params[:paper_id]}"
  end

  def destroy
    comment = Comment.find_by(user_id: current_user.id)
    comment.destroy
    redirect_to "/papers/#{params[:paper_id]}"
  end

  def edit
    @paper = Paper.find(params[:paper_id])
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    if comment.user_id == current_user.id
      comment.update(comment_params)
    end
    redirect_to "/papers/#{params[:paper_id]}"
  end

  private
  def create_params
    params.require(:comment).permit(:comment)
          .merge({paper_id: params[:paper_id], user_id: current_user.id})
  end

  private 
  def comment_params
    params.require(:comment).permit(:comment)
          .merge({paper_id: params[:paper_id], user_id: current_user.id})
  end

end
