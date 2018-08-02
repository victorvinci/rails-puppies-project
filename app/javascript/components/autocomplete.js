function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var petAddress = document.getElementById('pet_address');

    if (petAddress) {
      var autocomplete = new google.maps.places.Autocomplete(petAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(petAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
