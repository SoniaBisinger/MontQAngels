class ToiletPapersController < ApplicationController

  def index
    @toilet_papers = ToiletPaper.all
  end

  def show
    @toilet_paper = ToiletPaper.new
  end

end
