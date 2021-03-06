(function() {
  var bp;

  $('#smallSkinsImg path').on('click tap', function(e) {
    return $('#tinyIphone').animate({
      translate3d: "0," + (this.getAttribute('topposition')) + "px,0"
    }, 200, 'ease-in-out');
  });

  bp = Hammer($("#bigPhone")[0], {
    scale: false,
    transform_always_block: true
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
    posX: 0,
    posY: 0,
    last_touchX: 0,
    last_touchY: 0,
    rotation: 0,
    last_rotation: 0
  };

  bp.on("touch drag transform release", function(ev) {
    switch (ev.type) {
      case "touch":
        $("#bigPhone").css("border", "3px dashed #458");
        bp.h.x = ev.gesture.center.pageX;
        bp.h.y = ev.gesture.center.pageY;
        bp.h.last_touchX = bp.h.x;
        bp.h.last_touchY = bp.h.y;
        bp.h.last_rotation = bp.h.rotation;
        break;
      case "drag":
        bp.h.x = ev.gesture.center.pageX;
        bp.h.y = ev.gesture.center.pageY;
        bp.h.dx = bp.h.x - bp.h.last_touchX;
        bp.h.dy = bp.h.y - bp.h.last_touchY;
        bp.h.posX += bp.h.dx;
        bp.h.posY += bp.h.dy;
        bp.h.last_touchX = bp.h.x;
        bp.h.last_touchY = bp.h.y;
        break;
      case "transform":
        bp.h.rotation = bp.h.last_rotation + ev.gesture.rotation;
        break;
      case "release":
        $("#bigPhone").css("border", "none");
    }
    console.log(ev.gesture.center, bp.h);
    console.log("translate3d(" + bp.h.posX + "px," + bp.h.posY + "px,0) rotate(" + bp.h.rotation + "deg) ");
    return $("#bigPhone").animate({
      translate3d: "" + bp.h.posX + "px," + bp.h.posY + "px,0",
      rotate: "" + bp.h.rotation + "deg"
    }, 10, 'linear');
  });

}).call(this);
