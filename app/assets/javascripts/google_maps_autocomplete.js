function onPlaceChanged() {
  var place = this.getPlace();
  var components = getAddressComponents(place);

  var flatAddress = document.getElementById('flat_address');
  flatAddress.blur();}

  document.addEventListener("DOMContentLoaded", function() {
    var flatAddress = document.getElementById('flat_address');

    if (flatAddress) {
      var autocomplete = new google.maps.places.Autocomplete(flatAddress, { types: ['geocode'] });
      google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
      google.maps.event.addDomListener(flatAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
    }
  });
