import React, { useState } from "react";
import { Redirect, withRouter } from "react-router-dom";
import ErrorList from "./ErrorList";
import _ from 'lodash'

const NewReviewForm = (props) => {
  if (!props.user) {
    window.location.pathname = "/users/sign_in"
  }

  const [formSubmitted, setFormSubmitted] = useState(null)
  const maxReviewScore = 10
  const getScoreOptions = (max) => {
    let reviewOptions = []
    for (let i = 0; i <= max; i++) {
      reviewOptions.push(i)
    }
    const reviewJSX = reviewOptions.map((option) => {
      return (
        <option value={option} key={option}>{option}</option>
      )
    })
    return reviewJSX
  }

  const [review, setReview] = useState({
    score: "",
    title: "",
    body: "",
  })

  const handleUpdate = (event) => {
    setReview({
      ...review,
      [event.currentTarget.name]: event.currentTarget.value
    })
  }

  const [errors, setErrors] = useState({})

  const validSubmission = () => {
    let submitErrors = {}
    if (review.title.trim() === "") {
      submitErrors = {
        ...submitErrors,
        title: "is blank"
      }
    }
    if (review.score.trim() === "") {
      submitErrors = {
        ...submitErrors,
        score: "is blank"
      }
    }
    setErrors(submitErrors)
    return _.isEmpty(submitErrors)
  }

  const handleSubmit = async (event) => {
    event.preventDefault()
    if (validSubmission()) {
      await postUpdate(review)
    }
  }

  const postUpdate = async (formPayload) => {
    try {
      const response = await fetch(`/api/v1/movies/${props.match.params.id}/reviews`, {
        credentials: "same-origin",
        method: "POST",
        body: JSON.stringify(formPayload),
        headers: {
          "Accept": "application/json",
          "Content-type": "application/json"
        }
      })
      if (!response.ok) {
        const errorMessage = `${response.status} - ${response.statusText}`
        const error = new Error(errorMessage)
        throw (error)
      } else {
        setFormSubmitted(props.match.params.id)
      }
    } catch (err) {
      console.log(`Error! ${err}`)
    }
  }

  if (formSubmitted) {
    return <Redirect push to={`/movies/${props.match.params.id}`} />
  }

  return (
    <div className="form-card">
      <ErrorList errors={errors} />
      <form onSubmit={handleSubmit}>
        <label htmlFor="score">Quality Score</label>
        <select name="score" id="score" onChange={handleUpdate}>
          <option value=""></option>
          {getScoreOptions(maxReviewScore)}
        </select>

        <label htmlFor="title">Review Title</label>
        <input id="title" name="title" type="text" value={review.last_name} onChange={handleUpdate} />

        <label htmlFor="body">Review</label>
        <textarea id="body" name="body" type="textarea" value={review.email} onChange={handleUpdate} />

        <input type="submit" value="Add Review" className="button"/>
      </form>
    </div>
  )
}

export default withRouter(NewReviewForm)