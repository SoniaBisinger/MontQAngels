class ToiletPapersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_toilet_paper, only: %i[destroy update show]

  def index
    @toilet_papers = ToiletPaper.all
    return unless params[:query].present?

    sql_subquery = "title ILIKE :query OR description ILIKE :query"
    @toilet_papers = @toilet_papers.where(sql_subquery, query: "%#{params[:query]}%")
  end

  def mine
    @toilet_papers = current_user.toilet_papers
  end

  def show
    @toilet_paper = ToiletPaper.find(params[:id])
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
      redirect_to mine_toilet_papers_path(current_user)
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
    redirect_to user_toilet_papers_path(current_user), notice: "Toilet paper was successfully destroyed."
  end

  private

  def set_toilet_paper
    @toilet_paper = ToiletPaper.find(params[:id])
  end

  def toilet_paper_params
    params.require(:toilet_paper).permit(:title, :photo_url, :color, :thikness, :scent, :price, :used, :premium)
  end
end
