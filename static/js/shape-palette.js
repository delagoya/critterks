
$('#smallSkinsImg path').on('click tap', function(e) {
  return $('#tinyIphone').animate({
    translate3d: "0," + (this.getAttribute('topposition')) + "px,0"
  }, 200, 'ease-in-out');
});

$('#bigPhone').on('gesturestart touchstart mousedown', function(e) {
  return $('#rotateMessage').text(e.rotation || e.type);
});
