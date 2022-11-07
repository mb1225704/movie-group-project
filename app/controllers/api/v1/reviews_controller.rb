class Api::V1::ReviewsController < ApiController 
  def create
    review = Review.new(
      score: params["score"],
      title: params["title"],
      body: params["body"],
      user: current_user,
      movie: Movie.find(params["movie_id"]["id"])
    )
    
    if review.save
      render json: review
    else 
      render json: {errors: review.errors.full_messages}, status: :bad_request
    end
  end
end
