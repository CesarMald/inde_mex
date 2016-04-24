// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require frontend/bootstrap.min.js
//= require frontend/flexslider.min.js
//= require frontend/masonry.min.js
//= require frontend/smooth-scroll.min.js
//= require frontend/parallax.js
//= require frontend/scripts.js
//= require frontend/slick.min.js
//= require turbolinks
//
$('.multiple-items').slick({
      infinite: true,
      autoplay: false,
      slidesToShow: 4,
      slidesToScroll: 1,
      arrows: true,
      dots:false,
      responsive: [
    {
      breakpoint: 768,
      settings: {
        arrows: false,
        dots:true,
      }
    }
  ]
});
