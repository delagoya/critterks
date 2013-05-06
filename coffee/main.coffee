paper = Raphael("graphic",620,318)

iphone = paper.image("images/iphone4.png",0,0,620,318)

bigSkins = []

skinColors = [
  ['blue',"#54b2a2"],
  ['green', "#899d4e"],
  ['liteBlue',  "#b1cdc5"],
  ['pink', "#c44f7f"],
  ['yellow', "#f0c02b"]
]

currSkinIndex = 1

for x in [0..4]
  console.log(skinColors[x])
  bigSkin = paper.bigSkinPath().attr({
    fill: skinColors[x][1],
    stroke: "none", 
    opacity: 0})
  bigSkin.node.setAttribute('id',"bigSkin#{x}")
  bigSkin.transform("t14,10")
  if currSkinIndex == x
    bigSkin.attr({opacity: 1})
  bigSkins[x] = bigSkin

# left eye
leftEye = paper.circle(220,140,60).attr(whiteFill)
leftEye.shadow = leftEye.glow(shapeShadow)
rightEye = paper.circle(420,140,60).attr(whiteFill)
rightEye.shadow = rightEye.glow(shapeShadow)

leftPupilRed = paper.circle(200,160,10).attr(redFill)
leftPupilRed.shadow = leftPupilRed.glow(shapeShadow)
rightPupilRed = paper.circle(440,160,10).attr(redFill)
rightPupilRed.shadow = rightPupilRed.glow(shapeShadow)

# leftPupilRed.drag(moveMove,moveStart,moveEnd)
paper = Raphael("info",400,400)

fontShadowProps = {
  'text-anchor': 'start',
  'font-family': 'Helvetica',
  # 'font-weight': 'bold',
  fill: '#555',
  stroke: 'none',
  opacity: 0.5}

fontProps = {
  'text-anchor': 'start',
  'font-family': 'Helvetica',
  # 'font-weight': 'bold',
  fill: colors.black,
  stroke: 'none'}

shapeShadow = {
  width: 0.5,
  fill: false,
  opacity: 0.2,
  offsetx: 0,
  offsety: 1,
  color: '#555',
  stroke: 'none'
}

# talk bubble
talkBubble = paper.path("M250,70c0,5.523-4.125,10-9.213,10H28.888c-5.088,0-9.213-4.477-9.213-10V51.92L0,38.293l19.675-13.541V10
  c0-5.523,4.125-10,9.213-10h211.899C245.875,0,250,4.477,250,10V70z")
  .attr({fill: colors.liteYellow, stroke: 'none'})
  .transform('t9,10')
  .glow(shapeShadow)
paper.text(45,51, "You complete me.")
  .attr(fontShadowProps).attr({'font-size': 24})
paper.text(44,50, "You complete me.")
  .attr(fontProps).attr({'font-size': 24})

# more info
paper.text(40,300,"Create your own Critters\nwith multi-colored\npaper skins\nand self-adhesive\ndetails.")
  .attr(fontProps)
  .attr("font-size": 24)
# title = paper.text(10,50,"iPhone characters\nthat you design.")
#   .attr(fontShadowProps).attr('font-size': 24).transform("r5")
# title = paper.text(10,50,"iPhone characters\nthat you design.")
#   .attr(fontProps).attr('font-size': 24).transform("r5")