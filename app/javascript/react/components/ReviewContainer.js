import React, { Fragment } from "react"
import Review from "./Review"
import { Link, withRouter } from "react-router-dom"

const ReviewContainer = (props) => {

  const reviewList = props.reviews.map((review) => {
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

  return (
    <Fragment>
      <div className="grid-x review-header">
        <h2 className="large-offset-2"> Reviews </h2>
        <Link className="button" to={`/movies/${props.match.params.id}/reviews/new`}>{buttonMessage}</Link>
      </div>
      <div className="grid-x grid-margin-x review-list">
        {reviewList}
      </div>
    </Fragment>
  )
}

export default withRouter(ReviewContainer)