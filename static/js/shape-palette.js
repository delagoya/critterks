var bp, getRotationValue, registerMovable, shapeRegistry, touchTransform;

shapeRegistry = {};

if (!Hammer.HAS_TOUCHEVENTS && !Hammer.HAS_POINTEREVENTS) {
  Hammer.plugins.fakeMultitouch();
  Hammer.plugins.showTouches();
}

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

touchTransform = function(e) {
  var o;
  o = shapeRegistry[e.target.id];
  switch (e.type) {
    case "touch":
      $(this).css("border", "3px solid #888");
      o.hm.last_rotation = o.hm.rotation;
      o.hm.lX = e.gesture.center.pageX;
      o.hm.lY = e.gesture.center.pageY;
      break;
    case "drag":
      o.hm.posX += e.gesture.center.pageX - o.hm.lX;
      o.hm.posY += e.gesture.center.pageY - o.hm.lY;
      o.hm.lX = e.gesture.center.pageX;
      o.hm.lY = e.gesture.center.pageY;
      break;
    case "transform":
      o.hm.rotation = o.hm.last_rotation + e.gesture.rotation;
      break;
    case "release":
      $(this).animate({
        border: "none"
      }, 300);
      $(".fakeTouchPoint").animate({
        opacity: 0
      }, 300);
  }
  return $(this).animate({
    translate3d: "" + o.hm.posX + "px," + o.hm.posY + "px,0",
    rotate: "" + o.hm.rotation + "deg"
  }, 0);
};

registerMovable = function(name) {
  var o;
  o = Hammer($("#" + name)[0], {
    scale: false,
    transform_always_block: true,
    drag_block_horizontal: true,
    drag_block_vertical: true
  });
  o.hm = {
    posX: o.element.clientLeft,
    posY: o.element.clientTop,
    lX: 0,
    lY: 0,
    rotation: 0,
    last_rotation: 0
  };
  o.on("touch drag transform release", touchTransform);
  shapeRegistry[o.element.id] = o;
  return 0;
};

registerMovable("bigPhone");

registerMovable("bigPhone2");
