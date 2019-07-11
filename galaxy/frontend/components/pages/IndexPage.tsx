import * as React from 'react'
import { BrowserRouter as Router, Route, Link } from 'react-router-dom'
import HomePage from './HomePage'
import GraphPage from './GraphPage'
import Themed from '../global/Themed'

const IndexPage = () => {
  return (
    <Themed>
      <Router>
        <Route path="/" exact component={HomePage} />
        <Route path="/graph/" component={GraphPage} />
      </Router>
    </Themed>
  )
}

export default IndexPage
