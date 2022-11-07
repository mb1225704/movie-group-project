import React, { useState, useEffect } from 'react'
import { BrowserRouter, Route, Switch, Link } from 'react-router-dom'

import AuthenticatedRoute from './authentication/AuthenticatedRoute'
import NewReviewForm from './NewReviewForm'
import ShowContainer from './ShowContainer'

const App = (props) => {

  const [currentUser, setCurrentUser] = useState({})

  const getUser = async () => {
    try {
      const response = await fetch('/api/v1/users')
      if (!response.ok) {
        const errorMessage = `${response.status} ${response.statusText}`
        const error = new Error(errorMessage)
        throw (error)
      } else {
        const parsedUser = await response.json()
        setCurrentUser(parsedUser)
      }
    } catch (err) {
      console.log(`Error! - ${err}`)
    }
  }

  useEffect(() => {
    getUser()
  }, [])

  return (
    <BrowserRouter>
      <Switch>
        <Route exact path="/movies/:id" component={ShowContainer} />
        <Route exact path="/movies/:id/reviews/new" >
          <NewReviewForm user={currentUser} />
        </Route>

      </Switch>
    </BrowserRouter>
  )
}

export default App
