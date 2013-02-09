
$('#smallSkinsImg path').on('click tap', function(e) {
  return $('#tinyIphone').animate({
    translate3d: "0," + (this.getAttribute('topposition')) + "px,0"
  }, 200, 'ease-in-out');
});

$('#bigPhone').on('gesturestart', function(e) {
  return this.animate({
    rotate: e.rotatation
  }, 200, 'ease');
});
