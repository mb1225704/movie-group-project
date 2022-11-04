class Api::V1::MoviesController < ApiController 
    def show
      render json: Movie.find(params[:id]), include: ['reviews.user']
    end
end