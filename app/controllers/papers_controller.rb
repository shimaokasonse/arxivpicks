class PapersController < ApplicationController

  def index
    @papers = Paper.order("comments_count DESC").page(params[:page]).per(5)
  end

  def search
    @papers = Paper.where("title LIKE(?)","%#{params[:keyword]}%")
                   .order('comments_count DESC').page(params[:page]).per(5)
  end

  def show
    @paper = Paper.find(params[:id])
    @comments = @paper.comments.order('likes_count DESC').page(params[:page]).per(5)
  end

  def edit
    @paper = Paper.find(params[:id])
  end

  def update
    paper = Paper.find(params[:id])
    paper.update(update_params)
    redirect_to "/papers/#{params[:id]}"
  end

  private 
  def update_params
    params.require(:paper).permit(:headline,:image)
  end

end
