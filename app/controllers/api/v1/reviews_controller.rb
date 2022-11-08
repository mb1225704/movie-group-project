class Api::V1::ReviewsController < ApiController 
  def create
    review = Review.new(review_params)
    review.movie = Movie.find(params["movie_id"])
    review[:user_id] = current_user.id
    if review.save
      render json: review
    else 
      render json: {errors: review.errors.full_messages}, status: 401
    end
  end

  private

  def review_params
    params.require(:review).permit(:score, :title, :body)
  end
end
