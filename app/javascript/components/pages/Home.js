import React, { Component } from 'react'

import { BrowserRouter as Router, Link } from 'react-router-dom'

class Home extends Component {
  render() {
    return (
      <React.Fragment>
        <h1 className="center">I hear you have issues...</h1>
        <p>
          Welcome to the issue viewer. Repositories visible to your Github account are pulled in and you can check out all the issues you have!
        </p>

        <div className="center mt3 grow-large">
          <Link className="f10 link dim br2 ph3 pv2 white bg-green w-100" to="/repositories">
            <span className="f8">VIEW REPOS</span>
          </Link>
        </div>
      </React.Fragment>
    )
  }
}

export default Home;
