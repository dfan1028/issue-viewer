import React, { Component } from 'react';
import axios from 'axios';
import ReactPaginate from 'react-paginate';

import List from '../../layout/List';
import Pagination from '../../layout/Pagination';

class Issues extends Component {
  constructor(props) {
    super(props);

    this.state = {
      issues: [],
      pagination: {}
    };

    this.handlePageChange = this.handlePageChange.bind(this);
  }

  fetchData = (params) => {
    axios
      .get(`/api/issues/?repo_id=${ this.props.match.params.id }`, { params: params })
      .then(response => {
        this.setState({
          issues: response.data.issues,
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
        <h1 className="center">Issues For:</h1>
        <List items={ this.state.issues } resourceKey="issues" titleKey="title" />
        <Pagination
          totalPages={ this.state.pagination.total_pages }
          handlePageChange={ this.handlePageChange }
        />
      </React.Fragment>
    )
  }
}

export default Issues;
