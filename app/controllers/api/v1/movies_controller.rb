class Api::V1::MoviesController < ApiController 

    def show
        # binding.pry
        movie = Movie.find(params[:id])
        render json: movie
    end
  
end