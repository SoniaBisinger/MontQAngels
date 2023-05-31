class ToiletPapersController < ApplicationController
  before_action :set_toilet_paper, only: %i[:destroy, :update]
  before_action :authenticate_user!, except: %i[:index, :show]

  def index
    @toilet_papers = ToiletPaper.all
  end

  def show
    @toilet_paper = ToiletPaper.new
  end

  def new
    if @user == current_user
      @toilet_paper = ToiletPaper.new
    else 
      puts "you have to log-in to create a new product"
    end 
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

  def edit
    if user == current_user
      @toilet_paper = ToiletPaper.find(params[:id])
    end 
  end 

  def update
    @toilet_paper.update(toilet_paper_params)
  end 

  def destroy
    @toilet_paper.destroy
    redirect_to root_pathgit 
  end 

  private

  def set_toilet_paper
    @toilet_paper = ToiletPaper.find(params[:id])
  end


  def toilet_paper_params
      params.require(:toilet_paper).permit(:title, :photo_url, :color, :thikness, :scent, :price, :used, :premium)
  end
end
