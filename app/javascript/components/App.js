import React, { Component } from 'react';
import { Route, Switch } from 'react-router-dom';
import axios from 'axios';

import Home from './pages/Home';
import NoMatch from './pages/NoMatch';
import Repositories from './pages/repositories/Repositories';
import Issues from './pages/issues/Issues';
import Issue from './pages/issues/Issue';

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
        <main className="w-100" role="main">
          <div className="w-70 flex flex-column mt5 center">
            <Switch>
              <Route exact path="/" component={ Home } />
              <Route path="/repositories/:id" component={ Issues } />
              <Route path="/repositories" component={ Repositories } />
              <Route path="/issues/:id" component={ Issue } />

              <Route component={ NoMatch } />
            </Switch>
          </div>
        </main>
      </React.Fragment>
    )
  }
}

export default App;
