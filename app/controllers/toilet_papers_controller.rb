class ToiletPapersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_toilet_paper, only: %i[destroy update]

  def index
    @toilet_papers = ToiletPaper.all
  end

  def show
    @toilet_paper = ToiletPaper.new
  end

  def new
    if user_signed_in?
      @toilet_paper = ToiletPaper.new
    else
      redirect_to toilet_papers_path
    end
  end

  def create
    @toilet_paper = ToiletPaper.new(toilet_paper_params)
    @toilet_paper.user = current_user
    if @toilet_paper.save
      redirect_to user_toilet_papers_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    return unless user == current_user

    @toilet_paper = ToiletPaper.find(params[:id])
  end

  def update
    @toilet_paper.update(toilet_paper_params)
  end

  def destroy
    @toilet_paper.destroy
    redirect_to root_path
  end

  private

  def set_toilet_paper
    @toilet_paper = ToiletPaper.find(params[:id])
  end

  def toilet_paper_params
    params.require(:toilet_paper).permit(:title, :photo_url, :color, :thikness, :scent, :price, :used, :premium)
  end
end
