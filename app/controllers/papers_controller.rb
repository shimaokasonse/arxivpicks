class PapersController < ApplicationController

  def index
    @papers = Paper.all.order('id ASC').page(params[:page]).per(5)
  end

  def search
    @papers = Paper.where("title LIKE(?)","%#{params[:keyword]}%").limit(20)
  end

  def show
    @paper = Paper.find(params[:id])
    @comments = @paper.comments
  end


end
