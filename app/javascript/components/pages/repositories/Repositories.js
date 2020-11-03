import React, { Component } from 'react';
import axios from 'axios';
import ReactPaginate from 'react-paginate';

import List from '../../layout/List';
import RepositoryListValue from './RepositoryListValue';
import Pagination from '../../layout/Pagination';

class Repositories extends Component {
  constructor(props) {
    super(props);

    this.state = {
      repositories: [],
      meta: {},
      loaded: false
    };

    this.handlePageChange = this.handlePageChange.bind(this);
  }

  fetchData = (params) => {
    axios
      .get('/api/repositories', { params: params })
      .then(response => {
        this.setState({
          repositories: response.data.repositories,
          meta: response.data.meta,
          loaded: true
        });
      })
  }

  componentDidMount() {
    this.fetchData({ page: 1 });
  }

  handlePageChange = (data) => {
    this.fetchData({ page: data.selected + 1 })
  }

  render() {
    let hasRepos = this.state.repositories.length > 0;

    return (
      <React.Fragment>
        <h1 className="center">Your Repositories</h1>

        { hasRepos &&
          <List items={ this.state.repositories }
            resourceKey="repositories"
            displayValueComponent={ RepositoryListValue }
          />
        }

        { hasRepos &&
            <Pagination
              totalPages={ this.state.meta.total_pages }
              handlePageChange={ this.handlePageChange }
            />
        }

        { this.state.loaded && !hasRepos &&
          <p className="center">Are you even a developer?! How do you not have any repos?</p>
        }
      </React.Fragment>
    )
  }
}

export default Repositories;
