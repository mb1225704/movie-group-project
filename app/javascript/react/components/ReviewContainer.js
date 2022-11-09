import React, { Fragment } from "react"
import Review from "./Review"

const ReviewContainer = ({ reviews }) => {
  const reviewList = reviews.map((review) => {
    return (
      <Review
        key={review.id}
        id={review.id}
        score={review.score}
        title={review.title}
        body={review.body}
        username={review.user.username}
        // upvoteScore={upvoteScore}
        // setUpvoteScore={setUpvoteScore}
        // downVoteScore={upvoteScore}
        // setDownvoteScore={setDownvoteScore}
      />
    )
  })

  const onClick = () => {
    console.log('hello')
  }


  return (
    <Fragment>
      <div>
        <h2 className="large-offset-2"> Reviews </h2>
        <button className="button" onClick={onClick}>Add a Review</button>
      </div>
      <div className="grid-x grid-margin-x review-list">
        {reviewList}
      </div>
    </Fragment>
  )
}

export default ReviewContainer