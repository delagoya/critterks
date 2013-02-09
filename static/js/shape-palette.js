
$.each($('#smallSkinsImg path'), function(idx, item) {
  console.log(idx, item.id);
  return $("#" + item.id).on('click tap', function(e) {
    return $('#tinyIphone').animate({
      translate3d: "0," + (item.getAttribute('topposition')) + "px,0"
    }, 200, 'ease-in-out');
  });
});
