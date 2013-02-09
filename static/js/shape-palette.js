
$('#smallSkinsImg path').on('click tap', function(e) {
  return $('#tinyIphone').animate({
    translate3d: "0," + (this.getAttribute('topposition')) + "px,0"
  }, 200, 'ease-in-out');
});

$('#bigPhone').on('gesturechange touchstart mousedown', function(e) {
  $('#rotateMessage').text("" + e.type + " : " + e.rotation);
  e.preventDefault();
  if (e.type === 'gesturechange') {
    $("rotateMessage").insertAfer("#rotateMessage");
    return $(this.id).animate({
      rotate: e.rotation
    }, 200, 'linear');
  }
});
