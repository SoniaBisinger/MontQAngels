class ToiletPapersController < ApplicationController

  def index
    @toilet_papers = ToiletPaper.all
  end

  def show
    @toilet_paper = ToiletPaper.new
  end

  def new
      @toilet_paper = ToiletPaper.new
  end

  def create
    @toilet_paper = ToiletPaper.new(toilet_paper_params)
    @toilet_paper.user = current_user
      if @toilet_paper.save
          redirect_to root_path
      else
          render :new, status: :unprocessable_entity
      end
  end

  private

  def toilet_paper_params
      params.require(:toilet_paper).permit(:color, :thikness, :scent, :lenght, :price, :used, :premium)
  end
end
