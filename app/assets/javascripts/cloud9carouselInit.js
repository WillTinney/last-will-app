$(document).ready(function(){
  var mediaQuery = window.matchMedia( "(min-width: 768px)" );

  if (mediaQuery.matches) {
    $("#cloud9-carousel").Cloud9Carousel( {
      xRadius: 600,
      autoPlay: 1,
      bringToFront: true
    } );
  }
  else {
    $("#cloud9-carousel").Cloud9Carousel( {
      xRadius: 130,
      yRadius: 60,
      farScale: 0.05,
      autoPlay: 1,
      bringToFront: true
    } );
  }
})
