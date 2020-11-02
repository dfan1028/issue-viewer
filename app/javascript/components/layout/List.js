import React, { Component } from 'react';

import ListItem from './ListItem';

class List extends Component {
  render() {
    return (
      <ul className="list pl0 ml0 center mw8 ba b--light-silver br2">
        {
          this.props.items.map((item, index, arr) => (
            <ListItem
              key={ item.id }
              id={ item.id }
              displayValue={ item[this.props.titleKey] }
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
