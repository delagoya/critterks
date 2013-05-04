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
