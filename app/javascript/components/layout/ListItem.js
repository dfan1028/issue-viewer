import React, { Component } from 'react';

import { BrowserRouter as Router, Link } from 'react-router-dom'

class ListItem extends Component {
  render() {
    let DisplayValue = this.props.displayValueComponent;

    return (
      <Link className="link" to={ `/${this.props.resourceKey}/${ this.props.item.id }` }>
        <li className={ 'ph3 pv3 ' + (this.props.lastItem ? '' : 'bb b--light-silver')}>
          <DisplayValue item={ this.props.item } />
        </li>
      </Link>
    )
  }
}

export default ListItem;
