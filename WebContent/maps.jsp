<!DOCTYPE html>
<html>
  <head>
    
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
  </head>
  <body>
    <div id="map"></div>
    <script>
    
    
      // Note: This example requires that you consent to location sharing when
      // prompted by your browser. If you see the error "The Geolocation service
      // failed.", it means you probably did not give permission for the browser to
      // locate you.
      var map, infoWindow, marker = null;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 20.5937, lng: 78.9629}, 
          zoom: 6
        });
        infoWindow = new google.maps.InfoWindow;
        
        google.maps.event.addListener(map, 'click', function() {
            infoWindow.close();
            });

      google.maps.event.addListener(map, 'click', function(event) {
    	//call function to create marker
             if (marker) {
                marker.setMap(null);
                marker = null;
             }
    	 marker = createMarker(event.latLng, "name", "<b>Location</b><br>"+event.latLng);
      });

      
        
     // A function to create the marker and set up the event window function 
        function createMarker(latlng, name, html) {
            var contentString = html;
            var marker = new google.maps.Marker({
                position: latlng,
                map: map,
                zIndex: Math.round(latlng.lat()*-100000)<<5
                });

            google.maps.event.addListener(marker, 'click', function() {
                infoWindow.setContent(contentString); 
                infoWindow.open(map,marker);
                });
            google.maps.event.trigger(marker, 'click');    
            return marker;
        }

        // Try HTML5 geolocation.
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };

            infoWindow.setPosition(pos);
            infoWindow.setContent('Location found.');
            infoWindow.open(map);
            map.setCenter(pos);
          }, function() {
            handleLocationError(true, infoWindow, map.getCenter());
          });
        } else {
          // Browser doesn't support Geolocation
          handleLocationError(false, infoWindow, map.getCenter());
        }
      }

      function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
        infoWindow.open(map);
      }
      
      if (window.navigator.onLine) {
    	    google.maps.event.addDomListener(window, 'load', initialize);
    	} else {
    	    document.getElementById("map").text='Sorry, No internet connection.';
    	}
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKAPTCbTQYb0DDZmXXXvOt227urgxNeWc&callback=initMap">
    </script>
  </body>
</html>