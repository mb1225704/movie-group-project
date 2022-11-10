class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order('title')
    if user_signed_in?
      @user_display = " #{current_user.username}"
    end
  end
end 