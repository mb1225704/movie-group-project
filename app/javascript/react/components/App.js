import React from 'react'
import { BrowserRouter, Route, Switch } from 'react-router-dom'

import ShowContainer from './ShowContainer'

const App = (props) => {
  return (
    <BrowserRouter>
      <Switch>
        <Route exact path="/movies/:id" component={ShowContainer}/>
      </Switch>
    </BrowserRouter>
  )
}

export default App
