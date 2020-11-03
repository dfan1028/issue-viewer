import React, { Component } from 'react';

class RepositoryListValue extends Component {
  render() {
    return (
      <span>{ this.props.item.full_name }</span>
    )
  }
}

export default RepositoryListValue;
