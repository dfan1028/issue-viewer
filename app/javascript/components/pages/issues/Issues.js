import React, { Component } from 'react';
import axios from 'axios';

import List from '../../layout/List';

class Issues extends Component {
  state = {
    issues: []
  };

  componentDidMount() {
    axios
      .get(`/api/issues/?repo_id=${ this.props.match.params.id }`)
      .then(response => {
        this.setState({ issues: response.data });
      })
  }

  render() {
    return (
      <React.Fragment>
        <h1 className="center">Issues for:</h1>
        <List items={ this.state.issues } resourceKey="issues" titleKey="title" />
      </React.Fragment>
    )
  }
}

export default Issues;
