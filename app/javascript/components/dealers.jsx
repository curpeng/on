import React, { Component } from 'react'
import { PropTypes } from 'prop-types'
import DealersMap from './dealers_map'
import DealersList from './dealers_list'

class Dealers extends Component {
  state = {
    zoom: 7,
    longitude: this.props.dealers[0].longitude,
    latitude: this.props.dealers[0].latitude,
    chosenItemId: this.props.dealers[0].id
  }

  selectDealer = (dealer) => () => {
    this.setState({
      longitude: dealer.longitude,
      latitude: dealer.latitude,
      chosenItemId: dealer.id
    })
  }

  render() {
    const dealers = this.props.dealers

    return (
      <div>
        <DealersMap
          dealers = {dealers}
          zoom={this.state.zoom}
          center={
            {
              lng: this.state.longitude,
              lat: this.state.latitude
            }
          }
          onMarkerClick={this.selectDealer}
        />

        <DealersList
          dealers={dealers}
          onItemClick={this.selectDealer}
          chosenItemId={this.state.chosenItemId}
        />
      </div>
    )
  }
}

Dealers.propTypes = {
}

export default Dealers
