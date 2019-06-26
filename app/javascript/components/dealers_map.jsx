import React, { Component } from 'react'
import { PropTypes } from 'prop-types'
import GoogleMapReact from 'google-map-react';
import Marker from './marker'

const style = {
  height: '100vh',
  width: '60%',
  display: 'inline-block',
  verticalAlign: 'top'
}

class DealersMap extends Component {
  render() {
    const dealers = this.props.dealers
    const markers = dealers
    .map((dealer)=>(
      <Marker
          key={dealer.id }
          lat={dealer.latitude }
          lng={dealer.longitude }
          name={dealer.name }
          onClick = {this.props.onMarkerClick(dealer)}
      />
    ))
    return (
      <div style={style}>
        <GoogleMapReact
          zoom= {this.props.zoom}
          center={this.props.center}
        >
          {markers}
        </GoogleMapReact>
      </div>
    )
  }
}

DealersMap.propTypes = {
  onMarkerClick: PropTypes.func.isRequired,
  zoom: PropTypes.number.isRequired,
  center: PropTypes.object.isRequired,
  dealers: PropTypes.array.isRequired,
}

export default DealersMap
