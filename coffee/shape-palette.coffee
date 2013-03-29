# Use the shift key to add in multi-touch and show them
shapeRegistry = {}

if(!Hammer.HAS_TOUCHEVENTS && !Hammer.HAS_POINTEREVENTS)
  Hammer.plugins.fakeMultitouch()
  Hammer.plugins.showTouches()

## logo
# #bigSkin
# paper = Raphael("bigSkin",800,310)
# bs = paper.bigSkinPath().attr({fill: colors.green, stroke: 'none'})
# small Skins
# paper = Raphael("smallSkins",64,275)
# paper.image("images/iphone4-sm.png",0,0,64,33)
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
$('#smallSkinsImg path').on(
  'click tap',
  (e) ->
    $('#tinyIphone').animate(
      {translate3d: "0,#{this.getAttribute('topposition')}px,0" },
      200, 'ease-in-out'
    )
  )
# $('#bigPhone').on(
#   'gesturechange touchstart mousedown',
#   (e) ->
#     if (e.type == 'gesturechange')
#       $('#rotateMessage').text("#{e.type} : #{e.rotation} : #{this}")
#       $(this.id).animate({rotate: e.rotation }, 200, 'linear')
#   )

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
      $("#bigPhone").animate({ border: "none"} , 300)
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
