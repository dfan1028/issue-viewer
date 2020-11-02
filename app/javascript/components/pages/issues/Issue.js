import React, { Component } from 'react';
import axios from 'axios';

class Issue extends Component {
  state = {
    issue: {}
  };

  componentDidMount() {
    axios
      .get(`/api/issues/${ this.props.match.params.id }`)
      .then(response => {
        this.setState({ issue: response.data });
      })
  }

  render() {
    return (
      <React.Fragment>
        <h1 className="center">{ this.state.issue.title }</h1>
        <p>
          { this.state.issue.description }
        </p>
      </React.Fragment>
    )
  }
}

export default Issue;
