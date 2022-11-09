import React from "react"
import Review from "./Review"
import { Link, withRouter } from "react-router-dom"

const ReviewContainer = (props) => {

  let reviewList = props.reviews.map((review) => {
    return (
      <Review
        key={review.id}
        score={review.score}
        title={review.title}
        body={review.body}
        username={review.user.username}
      />
    )
  })

  let buttonMessage = "Sign in to add a Review"
  if (props.user) {
    buttonMessage = "Add a Review"
  }

  if (reviewList.length == 0) {
    reviewList = <h3>No reviews yet!</h3>
  }

  return (
    <div className="large-offset-3">
      <div className="grid-x review-header">
        <h2> Reviews </h2>
        <Link className="button" to={`/movies/${props.match.params.id}/reviews/new`}>{buttonMessage}</Link>
      </div>
      <div className="grid-x review-list">
        {reviewList}
      </div>
    </div>
  )
}

export default withRouter(ReviewContainer)