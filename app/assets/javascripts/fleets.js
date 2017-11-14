//= require_self

var fleet = JSON.parse($('.js-fleet-data').text());
var studentsAdresses = JSON.parse($('.js-students-adresses').text());

function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 13,
    center: {
      lat: -33.69111,
      lng: -72.89583
    }
  });

  var waypoints = studentsAdresses.map(function(address) {
    return {
      location: address.address,
      stopover: true
    };
  });

  var directionsDisplay = new google.maps.DirectionsRenderer({
    draggable: true,
    map: map
  });
  var directionsService = new google.maps.DirectionsService;

  directionsService.route({
    origin: fleet.starting_address,
    destination: fleet.destination_address,
    waypoints: waypoints,
    optimizeWaypoints: true,
    travelMode: 'DRIVING'
  }, function(response, status) {
    console.log(response, status)
    directionsDisplay.setDirections(response);
  });

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };
      map.setCenter(pos);
    });
  }
}
