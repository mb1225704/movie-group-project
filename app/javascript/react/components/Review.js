import React from "react"

const Review = ({ score, title, body, username }) => {
  return (
    <div className="review-card large-offset-2 large-8 small-12 callout">
      <h3>{title} - {score}/10</h3>
      <p className="review-body">{body}</p>
      <p>Posted by {username}</p>
    </div>
  )
}

export default Review