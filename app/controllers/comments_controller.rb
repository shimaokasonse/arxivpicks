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
  end

  def edit
  end

  def update
  end

  private
  def create_params
    params.require(:comment).permit(:comment)
          .merge({paper_id: params[:paper_id], user_id: current_user.id})
  end

end
