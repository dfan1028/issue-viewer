import React, { Component } from 'react';

import { BrowserRouter as Router, Link } from 'react-router-dom'

class ListItem extends Component {
  render() {
    return (
      <Link className="link" to={ `/${this.props.resourceKey}/${ this.props.id }` }>
        <li className={ 'ph3 pv3 ' + (this.props.lastItem ? '' : 'bb b--light-silver')}>
          { this.props.displayValue }
        </li>
      </Link>
    )
  }
}

export default ListItem;
