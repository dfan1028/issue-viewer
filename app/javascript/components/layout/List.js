import React, { Component } from 'react';

import ListItem from './ListItem';

class List extends Component {
  render() {
    return (
      <ul className="list pl0 ml0 center w-40-ns w-70-m w-100 ba b--light-silver br2">
        {
          this.props.items.map((item, index, arr) => (
            <ListItem
              key={ item.id }
              item={ item }
              displayValueComponent={ this.props.displayValueComponent }
              lastItem={ index === arr.length - 1 }
              resourceKey= { this.props.resourceKey }
            />
          ))
        }
      </ul>
    )
  }
}

export default List;
