class ToiletPapersController < ApplicationController
    before_action :set_toilet_paper, except: [:index, :new, :create]
    
    def index
        @toilet_papers = Toilet_papers.all
    end 

    def show 
        
    end 

    def new
        @toilet_paper = Toilet_paper.new
    end 

    def create
        @toilet_paper = Toilet_paper.new(toilet_paper_params)
        if @toilet_paper.save
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
    end 

    def edit
    end

    def update
    end 

    def delete

    end 

    private

    def set_toilet_paper
        @toilet_paper = Toilet_paper.find(params[:id])
    end

    def toilet_paper_params
        params.require(:toilet_paper).permit(:color, :thikness, :scent, :length, :price, :used, :premium)
    end 
end
