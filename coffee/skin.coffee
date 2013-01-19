paper = Raphael("skin",860,600)

#  from the DOM form with name="frmCritter"
form = document.frmCritter

# Path specs for skins
bigSkinPath = "M600,256.013C600,280.207,580.513,300,556.693,300H43.306C19.488,300,0,280.205,0,256.013V43.986 C0,19.795,19.488,0,43.306,0h513.385c23.82,0,43.307,19.795,43.307,43.986v212.027H600z M36.995,208.91 c-12.846,0-24.607,38.105-24.607,51.154c0,13.045,10.414,23.623,23.258,23.623c12.847,0,23.261-10.577,23.261-23.623 C58.908,247.016,49.842,208.91,36.995,208.91z"
smallSkinPath = "M60,25.602C60,28.021,58.052,30,55.67,30H4.331C1.949,30,0,28.021,0,25.602V4.399C0,1.979,1.949,0,4.331,0 h51.338C58.052,0,60,1.979,60,4.399V25.602L60,25.602z M3.7,20.891c-1.285,0-2.461,3.811-2.461,5.116 c0,1.304,1.042,2.362,2.326,2.362s2.326-1.058,2.326-2.362C5.891,24.702,4.984,20.891,3.7,20.891z"


## util attributes and functions
whiteFill =  {
  fill: "url(images/swatches/white.jpg)",
  stroke: "none",
  'stroke-width': 0 
}
redFill =  {
  fill: "url(images/swatches/red.jpg)",
  stroke: "none",
  'stroke-width': 0 
}

blackFill =  {
  fill: "url(images/swatches/black.jpg)",

  stroke: "none",
  'stroke-width': 0 
}

shapeShadow = {
  width: 0.5,
  fill: false,
  opacity: 0.4,
  offsetx: 0,
  offsety: 1,
  color: '#555',
  stroke: 'none'
}

moveHighlight = {
  'stroke-width': 2
  stroke: "#555"
  'stroke-dasharray': "-"
}

moveStart = (x,y,e) -> 
  this.shadow.remove()
  this.attr(moveHighlight)
  this.pox = 0
  this.poy = 0

moveMove = (dx,dy,x,y,e) -> 
  this.attr({transform: "...T#{dx - this.pox},#{dy - this.poy}" })
  this.pox = dx
  this.poy = dy

moveEnd = (e)  -> 
  this.shadow = this.glow(shapeShadow)
  this.attr({stroke: 'none', 'stroke-width': 0})


# skin colors pallete
verticalSpacer = 35
verticalOffset = 23

skinColors = [
  'pink',
  'blue',
  'purple',
  'green',
  'yellow',
  'orange'
  'lite_blue',
  'lite_green'
]

skinPos = (x * verticalSpacer for x in [0..7])
# console.log(form.skinColor.value)
currSkinIndex =  Number(form.skinColor.value)

# iphone
bigPhone = paper.image("images/iphone4.png",80,0,620,320)
smallPhone = paper.image("images/iphone4.png",0,verticalOffset - 2,63,33)
# move the smallPhone when a new color is clicked


bigSkin = paper.path(bigSkinPath)
  .attr({
    fill: "url(images/swatches/#{skinColors[currSkinIndex]}.jpg)",
    stroke: "none"}).transform("t93,12")

moveSmallPhoneStart = ->
  return if currSkinIndex == this.index
  currSkinIndex = this.index
  moveSmallPhoneMove(this)

moveSmallPhoneEnd = (e) -> 
  bigSkin.attr({fill: "url(images/swatches/#{skinColors[currSkinIndex]}.jpg)"})

moveSmallPhoneMove = () -> 
  smallPhone.animate({
    x: smallSkins[currSkinIndex].x - 2,
    y: smallSkins[currSkinIndex].y - 2,
  }, 200, "", moveSmallPhoneEnd)

smallSkins = []
for x in [0..7]
  ss = paper.path(smallSkinPath)
    .attr({
      fill: "url(images/swatches/#{skinColors[x]}.jpg)",
      stroke: "none",
    })
  ss.transform("t2,#{verticalSpacer * x + verticalOffset}")
  # ss.shadow = ss.glow(shapeShadow)
  ss.index = x
  ss.x = 2
  ss.y = verticalSpacer * x + verticalOffset
  ss.click(moveSmallPhoneStart)
  # ss.touchdown(moveSmallPhoneStart)
  smallSkins[x] = ss

## Cork Palette
paper.rect(80,330,620,200,20).attr({
  fill: "url(images/swatches/cork.jpg)",
  stroke: '#a08f33',
  'stroke-width': 2
}).glow(shapeShadow)

## Eyes
bigEyes = []
for x in [0..2]
  e  = paper.circle(200 + (x * 2),400,60).attr(whiteFill)
  e.shadow = e.glow(shapeShadow)
  e.drag(moveMove,moveStart,moveEnd)
  bigEyes[x] = e

smallEyes = []
for x in [0..2]
  e  = paper.circle(320 + (x * 2),385,40).attr(whiteFill)
  e.shadow = e.glow(shapeShadow)
  e.drag(moveMove,moveStart,moveEnd)
  smallEyes[x] = e

pupils = []
# big black
for x in [0..3]
  e = paper.circle(390 + x,400,20 ).attr({fill: "url(images/swatches/black.jpg)", stroke: 'none'})
  e.shadow = e.glow(shapeShadow)
  e.drag(moveMove,moveStart,moveEnd)
  pupils[x] = e
# big red
for x in [0..3]
  e = paper.circle(430 + x, 370,20 ).attr({
    fill: "url(images/swatches/red.jpg)", 
    stroke: 'none'})
  e.shadow = e.glow(shapeShadow)
  e.drag(moveMove,moveStart,moveEnd)
  pupils[x] = e
# small black 
for x in [0..3]
  e = paper.circle(390 + x,360,10 ).attr({fill: "url(images/swatches/black.jpg)", stroke: 'none'})
  e.shadow = e.glow(shapeShadow)
  e.drag(moveMove,moveStart,moveEnd)
  pupils[x] = e
# small red
for x in [0..3]
  e = paper.circle(430 + x,410,10 ).attr({fill: "url(images/swatches/red.jpg)", stroke: 'none'})
  e.shadow = e.glow(shapeShadow)
  e.drag(moveMove,moveStart,moveEnd)
  pupils[x] = e
## Mouths
# line (2)
mouths = []
for x in [0,1]
  e = paper.rect(380, 450 + (x * 15),200,10,5).attr({fill: "url(images/swatches/red.jpg)", stroke: 'none'})
  e.shadow = e.glow(shapeShadow)
  e.drag(moveMove,moveStart,moveEnd)
  mouths[x] = e
# oval (1)
mouths[2] = paper.ellipse(320,460,50,30).attr({fill: "url(images/swatches/red.jpg)", stroke: 'none'})
mouths[2].shadow = mouths[2].glow(shapeShadow)
mouths[2].drag(moveMove,moveStart,moveEnd)

## Teeth
# pointy teeth
pointyTeeth = []
for x in [0..4]
  e = paper.pointyTooth( 480 + (x * 40) , 360).attr(whiteFill)
  e.shadow = e.glow(shapeShadow)
  e.drag(moveMove,moveStart,moveEnd)
  pointyTeeth[x] = e

# square teeth
squareTeeth = []
for x in [0..4]
  e = paper.squareTooth(465 + (x * 40), 400).attr(whiteFill)
  e.shadow = e.glow(shapeShadow)
  e.drag(moveMove,moveStart,moveEnd)
  squareTeeth[x] = e
