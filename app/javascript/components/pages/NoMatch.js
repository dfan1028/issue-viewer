import React, { Component } from 'react';

import Corgasaurus from 'images/corgasaurus.png'

class NoMatch extends Component {
  render() {
    return (
      <React.Fragment>
        <h1 className="center">HEAD FOR THE HILLS!</h1>
        <p className="flex flex-column center">
          <img className="h7" src={ Corgasaurus } />
        </p>
      </React.Fragment>
    )
  }
}

export default NoMatch;
