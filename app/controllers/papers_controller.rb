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

end
