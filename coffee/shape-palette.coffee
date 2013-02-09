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
$('#bigPhone').on(
  'gesturechange touchstart mousedown',
  (e) ->
    $('#rotateMessage').text("#{e.type} : #{e.rotation}")
    e.preventDefault()
    if (e.type == 'gesturechange')
      $(this.id).animate({rotate: e.rotation }, 200, 'linear')
  )