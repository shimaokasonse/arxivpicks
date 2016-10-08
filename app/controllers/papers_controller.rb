class PapersController < ApplicationController

  def index
    ids = Comment.group(:paper_id).order('count_paper_id DESC')
                 .page(params[:page]).per(5).count(:paper_id).keys
    @papers = ids.map{ |id| Paper.find(id)}
  end

  def search
    @papers = Paper.where("title LIKE(?)","%#{params[:keyword]}%").limit(5).order('date DESC')
  end

  def show
    @paper = Paper.find(params[:id])
    @comments = @paper.comments
  end

end
