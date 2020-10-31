import React, { Component } from 'react'
import { Route, Switch } from 'react-router-dom'
import axios from 'axios'
import Home from './pages/Home'

class App extends Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    const token = document.querySelector('[name="csrf-token"]').content;
    axios.defaults.headers.common['X-CSRF-TOKEN'] = token;
  }

  render() {
    return (
      <React.Fragment>
        <main className="w-100 flex-column" role="main">
          <Switch>
            <Route exact path="/" component={ Home } />
          </Switch>
        </main>
      </React.Fragment>
    )
  }
}

export default App
