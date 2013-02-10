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
bp = Hammer($("#bigPhone")[0], {
  scale: false, 
  transform_always_block: true,
  drag_block_horizontal: true, 
  drag_block_vertical: true
})
# Use the shift key to add in multi-touch and show them
if(!Hammer.HAS_TOUCHEVENTS && !Hammer.HAS_POINTEREVENTS) 
  Hammer.plugins.fakeMultitouch()
  # Hammer.plugins.showTouches()
bp.h = {
  x: 0
  y: 0
  dx: 0
  dy: 0
  posX: 0
  posY: 0
  last_touchX: 0 
  last_touchY: 0 
  rotation: 0 
  last_rotation: 0
}
bp.on(
  "touch drag transform release", 
  (ev) ->
    switch ev.type
      when "touch"
        $("#bigPhone").css("border", "3px dashed #458")
        bp.h.x = ev.gesture.center.pageX
        bp.h.y = ev.gesture.center.pageY
        bp.h.last_touchX = bp.h.x
        bp.h.last_touchY = bp.h.y
        bp.h.last_rotation = bp.h.rotation
      when "drag"
        bp.h.x = ev.gesture.center.pageX
        bp.h.y = ev.gesture.center.pageY
        bp.h.dx = bp.h.x - bp.h.last_touchX
        bp.h.dy = bp.h.y - bp.h.last_touchY
        bp.h.posX += bp.h.dx
        bp.h.posY += bp.h.dy
        bp.h.last_touchX = bp.h.x
        bp.h.last_touchY = bp.h.y
      when "transform"
        bp.h.rotation = bp.h.last_rotation + ev.gesture.rotation
      when "release" 
        $("#bigPhone").css("border", "none")
    console.log(ev.gesture.center, bp.h)
    console.log("translate3d(#{bp.h.posX}px,#{bp.h.posY}px,0) rotate(#{bp.h.rotation}deg) ")
    $("#bigPhone").animate({
      translate3d: "#{bp.h.posX}px,#{bp.h.posY}px,0",
      rotate: "#{bp.h.rotation}deg"
      },10,'linear'
    )
)