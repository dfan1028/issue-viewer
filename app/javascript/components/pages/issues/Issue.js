import React, { Component } from 'react';
import axios from 'axios';

import ReactMarkdown from 'react-markdown';

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
        <ReactMarkdown>
          { this.state.issue.description }
        </ReactMarkdown>
      </React.Fragment>
    )
  }
}

export default Issue;
