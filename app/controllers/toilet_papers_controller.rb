class ToiletPapersController < ApplicationController

    def new
        @toilet_paper = ToiletPaper.new
    end

    def create
        @toilet_paper = ToiletPaper.new(toilet_paper_params)
        if @toilet_paper.save 
            redirect_to root_path
        else 
            render :new, status: :unprocessable_entity
        end 
    end 

    private 

    def toilet_paper_params
        params.require(:toilet_paper).permit(:color, :thickness, :scent, :price, :used, :premium, :photo_url, :title)
    end 
end
