class UsersController < ApplicationController
  def index
    @toilet_papers = current_user.toilet_papers
  end
end
