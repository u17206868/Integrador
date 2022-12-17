/*--=====================================
=            Aonomy Fixed Navbar        =
======================================--*/

(function($) { 
  "use strict"; 
  $(window).scroll(function() {
    if ($(this).scrollTop() > 1){  
      $('.aonomy-top').addClass("scroll-header");
    }
    else{
      $('.aonomy-top').removeClass("scroll-header");
    }
  });
})(jQuery);
 
/*--=====================================
=               Owl Caruosel            =
======================================--*/
 
(function($) { 
  "use strict"; 
  $('.aonomy-screen-carousel').owlCarousel({
      loop: true,
      margin: 30,
      autoplay: true,
      autoplayTimeout: 2000,
      responsive:{
      0:{
          items:1
      },
      500:{
          items:3
      },
      1000:{
          items:4
      }
    }
  });
})(jQuery);

/*--=====================================
=             Aonomy Preloader          =
======================================--*/

(function($) { 
  "use strict"; 
  $(window).on('load', function() {
    $(".aonomy-preloader").fadeOut("slow");
  });
})(jQuery);

/*--=====================================
=       Aonomy Statistics Number        =
======================================--*/

(function($) {
  "use strict"; 
  $('.aonomy-statistics-number').counterUp({
    delay: 10,
    time: 1000
  });
})(jQuery);

/*--=====================================
=         Aonomy Smooth Scroll          =
======================================--*/

if (typeof href === 'undefined') {
  (function($) {
    "use strict"; 
    $('.navbar-nav a').on('click', function() {
      $('html, body').animate({
          scrollTop: $( $.attr(this, 'href') ).offset().top-158
      }, 1000);
       return false;
    });
  })(jQuery);
}

/*--=====================================
=      Aonomy Animation on Scroll       =
======================================--*/

(function($) { 
  "use strict"; 
  $(window).on('load', function() {
    AOS.init({
      offset: 200,
      duration: 600,
      easing: 'ease-in-sine',
      delay: 100,
      disable: 'mobile'
    });
  });
})(jQuery);

/*--=====================================
=        Aonomy Parallax Effect         =
======================================--*/

(function($) { 
  "use strict"; 
  $(window).stellar({
    horizontalScrolling: false,
    verticalOffset: 0,
    horizontalOffset: 0
  });
})(jQuery);

/*--=====================================
=            Google Map Setting         =
======================================--*/

function initMap() {
  "use strict"; 
  // Create a new StyledMapType object, passing it an array of styles,
  // and the name to be displayed on the map type control.
  var styledMapType = new google.maps.StyledMapType(
    [
      {elementType: 'geometry', stylers: [{color: '#ebe3cd'}]},
      {elementType: 'labels.text.fill', stylers: [{color: '#523735'}]},
      {elementType: 'labels.text.stroke', stylers: [{color: '#f5f1e6'}]},
      {
        featureType: 'administrative',
        elementType: 'geometry.stroke',
        stylers: [{color: '#c9b2a6'}]
      },
      {
        featureType: 'administrative.land_parcel',
        elementType: 'geometry.stroke',
        stylers: [{color: '#dcd2be'}]
      },
      {
        featureType: 'administrative.land_parcel',
        elementType: 'labels.text.fill',
        stylers: [{color: '#ae9e90'}]
      },
      {
        featureType: 'landscape.natural',
        elementType: 'geometry',
        stylers: [{color: '#dfd2ae'}]
      },
      {
        featureType: 'poi',
        elementType: 'geometry',
        stylers: [{color: '#dfd2ae'}]
      },
      {
        featureType: 'poi',
        elementType: 'labels.text.fill',
        stylers: [{color: '#93817c'}]
      },
      {
        featureType: 'poi.park',
        elementType: 'geometry.fill',
        stylers: [{color: '#a5b076'}]
      },
      {
        featureType: 'poi.park',
        elementType: 'labels.text.fill',
        stylers: [{color: '#447530'}]
      },
      {
        featureType: 'road',
        elementType: 'geometry',
        stylers: [{color: '#f5f1e6'}]
      },
      {
        featureType: 'road.arterial',
        elementType: 'geometry',
        stylers: [{color: '#fdfcf8'}]
      },
      {
        featureType: 'road.highway',
        elementType: 'geometry',
        stylers: [{color: '#f8c967'}]
      },
      {
        featureType: 'road.highway',
        elementType: 'geometry.stroke',
        stylers: [{color: '#e9bc62'}]
      },
      {
        featureType: 'road.highway.controlled_access',
        elementType: 'geometry',
        stylers: [{color: '#e98d58'}]
      },
      {
        featureType: 'road.highway.controlled_access',
        elementType: 'geometry.stroke',
        stylers: [{color: '#db8555'}]
      },
      {
        featureType: 'road.local',
        elementType: 'labels.text.fill',
        stylers: [{color: '#806b63'}]
      },
      {
        featureType: 'transit.line',
        elementType: 'geometry',
        stylers: [{color: '#dfd2ae'}]
      },
      {
        featureType: 'transit.line',
        elementType: 'labels.text.fill',
        stylers: [{color: '#8f7d77'}]
      },
      {
        featureType: 'transit.line',
        elementType: 'labels.text.stroke',
        stylers: [{color: '#ebe3cd'}]
      },
      {
        featureType: 'transit.station',
        elementType: 'geometry',
        stylers: [{color: '#dfd2ae'}]
      },
      {
        featureType: 'water',
        elementType: 'geometry.fill',
        stylers: [{color: '#b9d3c2'}]
      },
      {
        featureType: 'water',
        elementType: 'labels.text.fill',
        stylers: [{color: '#92998d'}]
      }
    ],
    {name: 'Styled Map'});

  // Create a map object, and include the MapTypeId to add
  // to the map type control.
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 40.763673, lng: -73.925750},
    zoom: 11,
    mapTypeControlOptions: {
      mapTypeIds: ['roadmap', 'satellite', 'hybrid', 'terrain',
              'styled_map']
    }
  });

  //Associate the styled map with the MapTypeId and set it to display.
  map.mapTypes.set('styled_map', styledMapType);
  map.setMapTypeId('styled_map');
}

/*--=====================================
=              Particles Js             =
======================================--*/

(function($) { 
  "use strict"; 
  $(window).on("load", function() {
    particlesJS('particles-js',
	  {
		"particles": {
		  "number": {
			"value": 80,
			"density": {
			  "enable": true,
			  "value_area": 800
			}
		  },
		  "color": {
			"value": "#ffffff"
		  },
		  "shape": {
			"type": "circle",
			"stroke": {
			  "width": 0,
			  "color": "#000000"
			},
			"polygon": {
			  "nb_sides": 5
			},
			"image": {
			  "src": "img/github.svg",
			  "width": 100,
			  "height": 100
			}
		  },
		  "opacity": {
			"value": 0.5,
			"random": false,
			"anim": {
			  "enable": false,
			  "speed": 1,
			  "opacity_min": 0.1,
			  "sync": false
			}
		  },
		  "size": {
			"value": 5,
			"random": true,
			"anim": {
			  "enable": false,
			  "speed": 40,
			  "size_min": 0.1,
			  "sync": false
			}
		  },
		  "line_linked": {
			"enable": true,
			"distance": 150,
			"color": "#ffffff",
			"opacity": 0.4,
			"width": 1
		  },
		  "move": {
			"enable": true,
			"speed": 6,
			"direction": "none",
			"random": false,
			"straight": false,
			"out_mode": "out",
			"attract": {
			  "enable": false,
			  "rotateX": 600,
			  "rotateY": 1200
			}
		  }
		},
		"interactivity": {
		  "detect_on": "canvas",
		  "events": {
			"onhover": {
			  "enable": true,
			  "mode": "repulse"
			},
			"onclick": {
			  "enable": true,
			  "mode": "push"
			},
			"resize": true
		  },
		  "modes": {
			"grab": {
			  "distance": 400,
			  "line_linked": {
				"opacity": 1
			  }
			},
			"bubble": {
			  "distance": 400,
			  "size": 40,
			  "duration": 2,
			  "opacity": 8,
			  "speed": 3
			},
			"repulse": {
			  "distance": 200
			},
			"push": {
			  "particles_nb": 4
			},
			"remove": {
			  "particles_nb": 2
			}
		  }
		},
		"retina_detect": true,
		"config_demo": {
		  "hide_card": false,
		  "background_color": "#b61924",
		  "background_image": "",
		  "background_position": "50% 50%",
		  "background_repeat": "no-repeat",
		  "background_size": "cover"
		}
	  }
	);
  });
})(jQuery);