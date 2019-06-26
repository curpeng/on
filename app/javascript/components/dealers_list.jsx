import React, { Component } from 'react'
import { PropTypes } from 'prop-types'

const style = {
  height: '100vh',
  width: '30%',
  display: 'inline-block',
  verticalAlign: 'top',
  overflowY: 'auto',
  listStyle: 'none',
  cursor: 'pointer'
}

const chosenDealerStyle = {
  backgroundColor: 'yellow'
}

class DealersList extends Component {
  render() {
    const dealers = this.props.dealers

    return (
      <ul style={style}>
        { dealers.map((dealer)=>(
          <li
            key={dealer.id}
            onClick={this.props.onItemClick(dealer)}
            style={dealer.id === this.props.chosenItemId ? chosenDealerStyle : {}}
            >
              { dealer.name }
          </li>
        )) }
      </ul>
    )
  }
}


DealersList.propTypes = {
  onItemClick: PropTypes.func.isRequired,
  chosenItemId: PropTypes.number.isRequired,
  dealers: PropTypes.array.isRequired,
}

export default DealersList
