import React, {useState, useEffect} from "react"

const ShowContainer = (props) => {
    const [movie, setMovie] = useState({})

    const fetchMovie = async () => {
        const response = await fetch(`/api/v1/movies/${props.match.params.id}`)
        const parsedMovie = await response.json()
        setMovie(parsedMovie.movie)

    }

    useEffect(() => {
        fetchMovie()
    } , [])

    let movieSynopsis

    if(movie.description){
        movieSynopsis = movie.description
    } else {
        movieSynopsis = "There is not yet a synopsis for this movie. Check back later!"
    }

    return(
        <div>
            <h2 className = "large-offset-3">{`${movie.title} (${movie.release_date})`} <span className = "label">{movie.rating}</span></h2>
            <div className="show-body grid-x grid-margin-x">
                <img className="large-offset-3 large-4 small-12" src={movie.poster_image_url} alt={`${movie.title} poster image`}/>
                <div className="show-information cell large-5 small-12">
                    <p>Quality Score: {movie.score}/10</p>
                    <p>Runtime: {movie.runtime}</p>
                    <p>Genre(s): {movie.genre}</p>
                    <p>Language: {movie.language}</p>
                    <h3>Movie Synopsis</h3>
                    <p>{movieSynopsis}</p>
                </div>
            </div>
        </div>

    )

}

export default ShowContainer