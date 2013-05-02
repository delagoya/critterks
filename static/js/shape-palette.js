var bp, getRotationValue;

$('#smallSkinsImg path').on('click tap', function(e) {
  return $('#tinyIphone').animate({
    translate3d: "0," + (this.getAttribute('topposition')) + "px,0"
  }, 200, 'ease-in-out');
});

bp = Hammer($("#bigPhone")[0], {
  scale: false,
  transform_always_block: true,
  drag_block_horizontal: true,
  drag_block_vertical: true
});

if (!Hammer.HAS_TOUCHEVENTS && !Hammer.HAS_POINTEREVENTS) {
  Hammer.plugins.fakeMultitouch();
  Hammer.plugins.showTouches();
}

bp.h = {
  x: 0,
  y: 0,
  dx: 0,
  dy: 0,
  rotation: 0,
  lr: 0
};

getRotationValue = function(ev) {
  if (ev.gesture.srcEvent.type === 'mousemove' && ev.gesture.srcEvent.offsetX >= (ev.srcElement.width / 2)) {
    return 0 - ev.gesture.rotation;
  } else {
    return ev.gesture.rotation;
  }
};

bp.on("touch drag transform release", function(ev) {
  switch (ev.type) {
    case "touch":
      $("#bigPhone").css("border", "3px dashed #458");
      bp.h.x = ev.gesture.center.pageX;
      bp.h.y = ev.gesture.center.pageY;
      bp.h.lr = bp.h.rotation;
      break;
    case "drag":
      bp.h.dx += ev.gesture.center.pageX - bp.h.x;
      bp.h.dy += ev.gesture.center.pageY - bp.h.y;
      bp.h.x = ev.gesture.center.pageX;
      bp.h.y = ev.gesture.center.pageY;
      break;
    case "transform":
      bp.h.rotation = bp.h.lr + getRotationValue(ev);
      break;
    case "release":
      $("#bigPhone").css("border", "none");
      ev.gesture;
  }
  return $("#bigPhone").animate({
    translate3d: "" + bp.h.dx + "px," + bp.h.dy + "px,0",
    rotate: "" + bp.h.rotation + "deg"
  }, 10, 'linear');
});
