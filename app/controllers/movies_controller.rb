class MoviesController < ApplicationController
  def index
    if user_signed_in?
      @movies = Movie.all
      @user_display = current_user.username
    elsif !user_signed_in?
      @movies = Movie.where(rating: "PG")
      @user_display = "Stranger"
    end
  end
end