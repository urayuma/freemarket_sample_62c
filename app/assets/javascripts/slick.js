$(document).on('turbolinks:load', function(){
  $('.slider-thum').slick({
    arrows: false,
  });
  var image_count  = $('.item-detail-phone-cells .item-slider-li').length;
  switch(image_count){
    case 1 : $('.item-detail-phone-cells').slick({
        asNavFor:'.slider-thum',
        focusOnSelect: true,
        slidesToShow:1,
        draggable: false,
      });
    ; break;
    case 2 : $('.item-detail-phone-cells').slick({
        asNavFor:'.slider-thum',
        focusOnSelect: true,
        slidesToShow:2,
        draggable: false,
      });
    ; break;
    case 3 : $('.item-detail-phone-cells').slick({
        asNavFor:'.slider-thum',
        focusOnSelect: true,
        slidesToShow:3,
        draggable: false,
      });
    ; break;
    case 4 : $('.item-detail-phone-cells').slick({
        asNavFor:'.slider-thum',
        focusOnSelect: true,
        slidesToShow:4,
        draggable: false,
      });
    ; break;
    case 5 : $('.item-detail-phone-cells').slick({
        asNavFor:'.slider-thum',
        focusOnSelect: true,
        slidesToShow:5,
        draggable: false,
      });
    ; break;
    case 6 : $('.item-detail-phone-cells').slick({
        asNavFor:'.slider-thum',
        focusOnSelect: true,
        slidesToShow:6,
        draggable: false,
      });
    ; break;
    case 7 : $('.item-detail-phone-cells').slick({
        asNavFor:'.slider-thum',
        focusOnSelect: true,
        slidesToShow:7,
        draggable: false,
      });
    ; break;
    case 8 : $('.item-detail-phone-cells').slick({
        asNavFor:'.slider-thum',
        focusOnSelect: true,
        slidesToShow:8,
        draggable: false,
      });
    ; break;
    case 9 : $('.item-detail-phone-cells').slick({
        asNavFor:'.slider-thum',
        focusOnSelect: true,
        slidesToShow:9,
        draggable: false,
      });
    ; break;
    case 10 : $('.item-detail-phone-cells').slick({
        asNavFor:'.slider-thum',
        focusOnSelect: true,
        slidesToShow:10,
        draggable: false,
      });
    ; break;
  }
});
