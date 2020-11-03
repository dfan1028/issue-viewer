import React, { Component } from 'react';

class IssueListValue extends Component {
  render() {
    return (
      <React.Fragment>
        <div className='flex flex-column'>
          <div className='flex flex-wrap'>
            <div className='f6'>Issue #{ this.props.item.number }</div>
          </div>
          <div className='flex flex-wrap mt2'>
            <div className='b'>{ this.props.item.title }</div>
          </div>
          <div className='flex flex-wrap justify-between mt2'>
            <div className='f6'>{ this.props.item.author }</div>
            <div className='f6'>Created: { this.props.item.remote_created_at }</div>
          </div>
        </div>
      </React.Fragment>
    )
  }
}

export default IssueListValue;
