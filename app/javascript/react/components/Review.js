import React from "react"
import VotesContainer from "./VotesContainer"

const Review = ({ score, title, body, username, id }) => {
  return (
    <div className="review-card large-offset-2 large-8 small-12 callout">
      <h3>{title} - {score}/10</h3>
      <p className="review-body">{body}</p>
      <VotesContainer 
        review_id ={id} 
      />
      <p>Posted by {username}</p>
    </div>
  )
}

export default Review