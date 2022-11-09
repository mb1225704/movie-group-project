class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    if user_signed_in?
      @user_display = current_user.username
    end
  end
end