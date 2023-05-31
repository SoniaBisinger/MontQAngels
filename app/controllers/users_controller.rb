class UsersController < ApplicationController
  def index
    @user_toilet_papers = current_user.toilet_papers
  end
end
