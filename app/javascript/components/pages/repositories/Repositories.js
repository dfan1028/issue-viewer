import React, { Component } from 'react';
import axios from 'axios';
import ReactPaginate from 'react-paginate';

import List from '../../layout/List';
import Pagination from '../../layout/Pagination';

class Repositories extends Component {
  constructor(props) {
    super(props);

    this.state = {
      repositories: [],
      pagination: {}
    };

    this.handlePageChange = this.handlePageChange.bind(this);
  }

  fetchData = (params) => {
    axios
      .get('/api/repositories', { params: params })
      .then(response => {
        this.setState({
          repositories: response.data.repositories,
          pagination: response.data.meta
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
    return (
      <React.Fragment>
        <h1 className="center">Your Repositories</h1>
        <List items={ this.state.repositories } resourceKey="repositories" titleKey="full_name" />
        <Pagination
          totalPages={ this.state.pagination.total_pages }
          handlePageChange={ this.handlePageChange }
        />
      </React.Fragment>
    )
  }
}

export default Repositories;
