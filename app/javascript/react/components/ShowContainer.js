import React, { useState, useEffect } from "react"
import ReviewContainer from "./ReviewContainer"

const ShowContainer = (props) => {
  const [movie, setMovie] = useState({ current_user: "" })
  const [reviews, setReviews] = useState([])

  const fetchMovie = async () => {
    try {
      const response = await fetch(`/api/v1/movies/${props.match.params.id}`)
      if (!response.ok) {
        const errorMessage = `${response.status} ${response.statusText}`
        const error = new Error(errorMessage)
        throw (error)
      } else {
        const parsedMovie = await response.json()
        setMovie(parsedMovie.movie)
        setReviews(parsedMovie.movie.reviews)
      }

    } catch (err) {
      console.log(`Error! - ${err}`)
    }
  }

  useEffect(() => {
    fetchMovie()
  }, [])

  let movieSynopsis

  if (movie.description) {
    movieSynopsis = movie.description
  } else {
    movieSynopsis = "There is not yet a synopsis for this movie. Check back later!"
  }

  return (
    <div>
      <h2 className="large-offset-3">{`${movie.title}(${movie.release_date})`} <span className="label">{movie.rating}</span></h2>
      <div className="show-body grid-x grid-margin-x">
        <img className="large-offset-3 large-4 small-12" src={movie.poster_image_url} alt={`${movie.title} poster image`} />
        <div className="show-information cell large-5 small-12">
          <p>Quality Score: {movie.score}/10</p>
          <p>Runtime: {movie.runtime}</p>
          <p>Genre(s): {movie.genre}</p>
          <p>Language: {movie.language}</p>
          <h3>Movie Synopsis</h3>
          <p>{movieSynopsis}</p>
        </div>
      </div>
      <ReviewContainer
        reviews={reviews}
        setReviews={setReviews}
      />
    </div>
  )
}

export default ShowContainer