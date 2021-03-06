# Use the shift key to add in multi-touch and show them

## logo
# #bigSkin
# paper = Raphael("bigSkin",800,310)
# bs = paper.bigSkinPath().attr({fill: colors.green, stroke: 'none'})
# small Skins
# paper = Raphael("smallSkins",64,275)
# verticalSpacer = 35
# verticalOffset = 0
# skinColors = [
#   'pink',
#   'blue',
#   'purple',
#   'green',
#   'yellow',
#   'orange'
#   'liteBlue',
#   'liteGreen'
# ]
# sss = []
# for x in [0..7]
#   ss = paper.smallSkinPath()
#     .attr({
#       fill: colors[skinColors[x]],
#       stroke: "none",
#     })
#   ss.transform("t0,#{verticalSpacer * x + verticalOffset}")
#   ss.node.setAttribute("index", x)
#   ss.node.setAttribute("topPosition", "#{verticalSpacer * x + verticalOffset}")
#   ss.node.setAttribute("id", "smallSkin#{x}")
# $('#bigPhone').on(
#   'gesturechange touchstart mousedown',
#   (e) ->
#     if (e.type == 'gesturechange')
#       $('#rotateMessage').text("#{e.type} : #{e.rotation} : #{this}")
#       $(this.id).animate({rotate: e.rotation }, 200, 'linear')
#   )

# CSS transform to move the color chooser
$('#smallSkinsImg path').on(
  'click tap',
  (e) ->
    $('#tinyIphone').animate(
      {translate3d: "0,#{this.getAttribute('topposition')}px,0" },
      200, 'ease-in-out'
    )
  )

shapeRegistry = {}
# Use the shift key to add in multi-touch and show them
if(!Hammer.HAS_TOUCHEVENTS && !Hammer.HAS_POINTEREVENTS) 
  Hammer.plugins.fakeMultitouch()
  Hammer.plugins.showTouches()

bp = Hammer($("#bigPhone")[0], {
  scale: false, 
  transform_always_block: true,
  drag_block_horizontal: true, 
  drag_block_vertical: true
})

bp.h = {
  x: 0
  y: 0
  dx: 0
  dy: 0
  rotation: 0 
  lr: 0
}

getRotationValue = (ev) -> 
  if ev.gesture.srcEvent.type == 'mousemove' &&  ev.gesture.srcEvent.offsetX >= (ev.srcElement.width / 2)
    # return  (ev.gesture.rotation)
    return  (0 - ev.gesture.rotation)
  else
    return ev.gesture.rotation
bp.on(
  "touch drag transform release", 
  (ev) ->
    # console.log(ev)
    switch ev.type
      when "touch"
        $("#bigPhone").css("border", "3px dashed #458")
        bp.h.x = ev.gesture.center.pageX
        bp.h.y = ev.gesture.center.pageY
        bp.h.lr = bp.h.rotation
      when "drag"
        bp.h.dx += ev.gesture.center.pageX - bp.h.x
        bp.h.dy += ev.gesture.center.pageY - bp.h.y
        bp.h.x = ev.gesture.center.pageX
        bp.h.y = ev.gesture.center.pageY
      when "transform"
        bp.h.rotation = bp.h.lr + getRotationValue(ev)
      when "release" 
        $("#bigPhone").css("border", "none")
        ev.gesture
    # console.log(ev.gesture.center, bp.h)
    # console.log("translate3d(#{bp.h.posX}px,#{bp.h.posY}px,0) rotate(#{bp.h.rotation}deg) ")
    $("#bigPhone").animate({
      translate3d: "#{bp.h.dx}px,#{bp.h.dy}px,0",
      rotate: "#{bp.h.rotation}deg"
      },10,'linear'
    )
)

touchTransform = (e) ->
  o = shapeRegistry[e.target.id]
  switch e.type
    when "touch"
      $(this).css("border", "3px solid #888")
      o.hm.last_rotation = o.hm.rotation
      o.hm.lX = e.gesture.center.pageX
      o.hm.lY = e.gesture.center.pageY
    when "drag"
      o.hm.posX += e.gesture.center.pageX - o.hm.lX
      o.hm.posY += e.gesture.center.pageY - o.hm.lY
      o.hm.lX = e.gesture.center.pageX
      o.hm.lY = e.gesture.center.pageY
    when "transform"
      # see if touch is on right side of the shape
      o.hm.rotation = o.hm.last_rotation + e.gesture.rotation
    when "release"
      $(this).animate({ border: "none"} , 300)
      $(".fakeTouchPoint").animate({opacity: 0}, 300)
  $(this).animate({
    translate3d: "#{o.hm.posX }px,#{o.hm.posY}px,0",
    rotate: "#{o.hm.rotation}deg"
    },0)


registerMovable = (name) ->
  o = Hammer($("##{name}")[0],
    {
      scale: false,
      transform_always_block: true,
      drag_block_horizontal: true,
      drag_block_vertical: true
    }
  )
  o.hm = {
    posX: o.element.clientLeft
    posY: o.element.clientTop
    lX: 0
    lY: 0
    rotation: 0
    last_rotation: 0
  }
  o.on("touch drag transform release", touchTransform)
  shapeRegistry[o.element.id] = o
  0

registerMovable("bigPhone")
registerMovable("bigPhone2")
