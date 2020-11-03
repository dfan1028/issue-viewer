import React, { Component } from 'react';

import ReactPaginate from 'react-paginate';

class Pagination extends Component {
  render() {
    return (
      <ReactPaginate
        pageCount={ this.props.totalPages }
        pageRangeDisplayed={3}
        marginPagesDisplayed={2}
        onPageChange={ this.props.handlePageChange }
        previousLabel="<"
        nextLabel=">"
        breakLabel="..."
        breakClassName="pa3"
        containerClassName="flex list center mb4 pa0"
        pageClassName="pa3"
        activeClassName="b"
        disabledClassName="gray"
        previousClassName="pa3 pointer"
        nextClassName="pa3 pointer"
        pageLinkClassName="pointer"
      />
    )
  }
}

export default Pagination;
