import { method } from 'lodash';
import React, { useState } from 'react';

const VotesContainer = (props) => {
    const [count, setCount] = useState(0);

    const increment = () => {
        setCount(count + 1)
    }

    const decrement = () => {
        setCount(count - 1)
    }

    const handleVotes = async (event) => {
        event.preventDefault()
        fetchVotes()
    }

    const fetchVotes = async (votesPayLoad) => {
        try {
            const response = await fetch(`/api/v1/reviews/${props.review_id}/votes`, {
                credentials: "same-origin",
                method: "POST",
                body: JSON.stringify(votesPayLoad),
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
                setCount(votesPayLoad)
            }
        } catch (err) {
            console.log(`Error! ${err}`)  
        }
    }

    return (
        <div >
            <button className="button"onClick={handleVotes}>
                Upvote
            </button>
            <button className="button" onClick={decrement}>
                Downvote
            </button>
            <p className='review-card'>{count}</p>
        </div>
    )
}

export default VotesContainer;