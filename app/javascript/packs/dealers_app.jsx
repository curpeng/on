// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import Dealers from '../components/dealers'

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('dealers-app')
  const data = JSON.parse(node.getAttribute('data'))

  const dealers = data.map((dealer_json) => {
    dealer_json.latitude = parseFloat(dealer_json.latitude)
    dealer_json.longitude = parseFloat(dealer_json.longitude)
    return dealer_json
  })

  ReactDOM.render(
    <Dealers
      name='dealers'
      dealers={dealers}
    />,
    node
  )
})
