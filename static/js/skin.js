var bigEyes, bigPhone, bigSkin, bigSkinPath, blackFill, currSkinIndex, e, form, mouths, moveEnd, moveHighlight, moveMove, moveSmallPhoneEnd, moveSmallPhoneMove, moveSmallPhoneStart, moveStart, paper, pointyTeeth, pupils, redFill, shapeShadow, skinColors, skinPos, smallEyes, smallPhone, smallSkinPath, smallSkins, squareTeeth, ss, verticalOffset, verticalSpacer, whiteFill, x, _i, _j, _len, _len2, _ref, _ref2;

paper = Raphael("skin", 860, 600);

form = document.frmCritter;

bigSkinPath = "M600,256.013C600,280.207,580.513,300,556.693,300H43.306C19.488,300,0,280.205,0,256.013V43.986 C0,19.795,19.488,0,43.306,0h513.385c23.82,0,43.307,19.795,43.307,43.986v212.027H600z M36.995,208.91 c-12.846,0-24.607,38.105-24.607,51.154c0,13.045,10.414,23.623,23.258,23.623c12.847,0,23.261-10.577,23.261-23.623 C58.908,247.016,49.842,208.91,36.995,208.91z";

smallSkinPath = "M60,25.602C60,28.021,58.052,30,55.67,30H4.331C1.949,30,0,28.021,0,25.602V4.399C0,1.979,1.949,0,4.331,0 h51.338C58.052,0,60,1.979,60,4.399V25.602L60,25.602z M3.7,20.891c-1.285,0-2.461,3.811-2.461,5.116 c0,1.304,1.042,2.362,2.326,2.362s2.326-1.058,2.326-2.362C5.891,24.702,4.984,20.891,3.7,20.891z";

whiteFill = {
  fill: "url(images/swatches/white.jpg)",
  stroke: "none",
  'stroke-width': 0
};

redFill = {
  fill: "url(images/swatches/red.jpg)",
  stroke: "none",
  'stroke-width': 0
};

blackFill = {
  fill: "url(images/swatches/black.jpg)",
  stroke: "none",
  'stroke-width': 0
};

shapeShadow = {
  width: 0.5,
  fill: false,
  opacity: 0.4,
  offsetx: 0,
  offsety: 1,
  color: '#555',
  stroke: 'none'
};

moveHighlight = {
  'stroke-width': 2,
  stroke: "#555",
  'stroke-dasharray': "-"
};

moveStart = function(x, y, e) {
  this.shadow.remove();
  this.attr(moveHighlight);
  this.pox = 0;
  return this.poy = 0;
};

moveMove = function(dx, dy, x, y, e) {
  this.attr({
    transform: "...T" + (dx - this.pox) + "," + (dy - this.poy)
  });
  this.pox = dx;
  return this.poy = dy;
};

moveEnd = function(e) {
  this.shadow = this.glow(shapeShadow);
  return this.attr({
    stroke: 'none',
    'stroke-width': 0
  });
};

verticalSpacer = 35;

verticalOffset = 23;

skinColors = ['pink', 'blue', 'purple', 'green', 'yellow', 'orange', 'lite_blue', 'lite_green'];

skinPos = (function() {
  var _results;
  _results = [];
  for (x = 0; x <= 7; x++) {
    _results.push(x * verticalSpacer);
  }
  return _results;
})();

currSkinIndex = Number(form.skinColor.value);

bigPhone = paper.image("images/iphone4.png", 80, 0, 620, 320);

smallPhone = paper.image("images/iphone4.png", 0, verticalOffset - 2, 63, 33);

bigSkin = paper.path(bigSkinPath).attr({
  fill: "url(images/swatches/" + skinColors[currSkinIndex] + ".jpg)",
  stroke: "none"
}).transform("t93,12");

moveSmallPhoneStart = function() {
  if (currSkinIndex === this.index) return;
  currSkinIndex = this.index;
  return moveSmallPhoneMove(this);
};

moveSmallPhoneEnd = function(e) {
  return bigSkin.attr({
    fill: "url(images/swatches/" + skinColors[currSkinIndex] + ".jpg)"
  });
};

moveSmallPhoneMove = function() {
  return smallPhone.animate({
    x: smallSkins[currSkinIndex].x - 2,
    y: smallSkins[currSkinIndex].y - 2
  }, 200, "", moveSmallPhoneEnd);
};

smallSkins = [];

for (x = 0; x <= 7; x++) {
  ss = paper.path(smallSkinPath).attr({
    fill: "url(images/swatches/" + skinColors[x] + ".jpg)",
    stroke: "none"
  });
  ss.transform("t2," + (verticalSpacer * x + verticalOffset));
  ss.index = x;
  ss.x = 2;
  ss.y = verticalSpacer * x + verticalOffset;
  ss.click(moveSmallPhoneStart);
  smallSkins[x] = ss;
}

paper.rect(80, 330, 620, 200, 20).attr({
  fill: "url(images/swatches/cork.jpg)",
  stroke: '#a08f33',
  'stroke-width': 2
}).glow(shapeShadow);

bigEyes = [];

for (x = 0; x <= 2; x++) {
  e = paper.circle(200 + (x * 2), 400, 60).attr(whiteFill);
  e.shadow = e.glow(shapeShadow);
  e.drag(moveMove, moveStart, moveEnd);
  bigEyes[x] = e;
}

smallEyes = [];

for (x = 0; x <= 2; x++) {
  e = paper.circle(320 + (x * 2), 385, 40).attr(whiteFill);
  e.shadow = e.glow(shapeShadow);
  e.drag(moveMove, moveStart, moveEnd);
  smallEyes[x] = e;
}

pupils = [];

for (x = 0; x <= 3; x++) {
  e = paper.circle(390 + x, 400, 20).attr(blackFill);
  e.shadow = e.glow(shapeShadow);
  e.drag(moveMove, moveStart, moveEnd);
  pupils[x] = e;
}

for (x = 0; x <= 3; x++) {
  e = paper.circle(430 + x, 370, 20).attr(redFill);
  e.shadow = e.glow(shapeShadow);
  e.drag(moveMove, moveStart, moveEnd);
  pupils[x] = e;
}

for (x = 0; x <= 3; x++) {
  e = paper.circle(390 + x, 360, 10).attr(blackFill);
  e.shadow = e.glow(shapeShadow);
  e.drag(moveMove, moveStart, moveEnd);
  pupils[x] = e;
}

for (x = 0; x <= 3; x++) {
  e = paper.circle(430 + x, 410, 10).attr(redFill);
  e.shadow = e.glow(shapeShadow);
  e.drag(moveMove, moveStart, moveEnd);
  pupils[x] = e;
}

mouths = [];

_ref = [0, 1];
for (_i = 0, _len = _ref.length; _i < _len; _i++) {
  x = _ref[_i];
  e = paper.rect(380, 450 + (x * 15), 200, 10, 5).attr(redFill);
  e.shadow = e.glow(shapeShadow);
  e.drag(moveMove, moveStart, moveEnd);
  mouths[x] = e;
}

_ref2 = [0, 1];
for (_j = 0, _len2 = _ref2.length; _j < _len2; _j++) {
  x = _ref2[_j];
  e = paper.rect(380, 480 + (x * 15), 200, 10, 5).attr(blackFill);
  e.shadow = e.glow(shapeShadow);
  e.drag(moveMove, moveStart, moveEnd);
}

mouths[2] = paper.ellipse(320, 460, 50, 30).attr(redFill);

mouths[2].shadow = mouths[2].glow(shapeShadow);

mouths[2].drag(moveMove, moveStart, moveEnd);

pointyTeeth = [];

for (x = 0; x <= 4; x++) {
  e = paper.pointyTooth(480 + (x * 40), 360).attr(whiteFill);
  e.shadow = e.glow(shapeShadow);
  e.drag(moveMove, moveStart, moveEnd);
  pointyTeeth[x] = e;
}

squareTeeth = [];

for (x = 0; x <= 4; x++) {
  e = paper.squareTooth(465 + (x * 40), 400).attr(whiteFill);
  e.shadow = e.glow(shapeShadow);
  e.drag(moveMove, moveStart, moveEnd);
  squareTeeth[x] = e;
}
