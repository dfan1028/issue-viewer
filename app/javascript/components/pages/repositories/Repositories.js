import React, { Component } from 'react';
import axios from 'axios';

import List from '../../layout/List';

class Repositories extends Component {
  state = {
    repositories: []
  };

  componentDidMount() {
    axios
      .get('/api/repositories')
      .then(response => {
        this.setState({ repositories: response.data });
      })

    console.log("mounted");
  }

  render() {
    return (
      <React.Fragment>
        <h1 className="center">Your repositories</h1>
        <List items={ this.state.repositories } resourceKey="repositories" titleKey="full_name" />
      </React.Fragment>
    )
  }
}

export default Repositories;
