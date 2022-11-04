import React, { Fragment } from "react"
import Review from "./Review"

const ReviewContainer = ({ reviews }) => {

  const reviewList = reviews.map((review) => {
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

  return (
    <Fragment>
      <h2 className="large-offset-2"> Reviews </h2>
      <div className="grid-x grid-margin-x review-list">
        {reviewList}
      </div>
    </Fragment>
  )
}

export default ReviewContainer