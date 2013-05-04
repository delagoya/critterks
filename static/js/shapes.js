// Generated by CoffeeScript 1.6.2
Raphael.fn.pointyTooth = function(x, y) {
  return this.path("M" + x + "," + y + " l20,0 l-20,30 l-20,-30z").attr({
    stroke: 'none',
    opacity: 0
  });
};

Raphael.fn.squareTooth = function(x, y) {
  return this.path("M" + x + "," + y + " l27,0 l0,25 t-2,2 l-23,0 t-2,-2 z").attr({
    stroke: 'none',
    opacity: 0
  });
};

Raphael.fn.bigSkinPath = function() {
  return this.path("M600,256.013C600,280.207,580.513,300,556.693,300H43.306C19.488,300,0,280.205,0,256.013V43.986 C0,19.795,19.488,0,43.306,0h513.385c23.82,0,43.307,19.795,43.307,43.986v212.027H600z M36.995,208.91 c-12.846,0-24.607,38.105-24.607,51.154c0,13.045,10.414,23.623,23.258,23.623c12.847,0,23.261-10.577,23.261-23.623 C58.908,247.016,49.842,208.91,36.995,208.91z").attr({
    stroke: 'none',
    opacity: 0
  });
};

Raphael.fn.smallSkinPath = function() {
  return this.path("M60,25.602C60,28.021,58.052,30,55.67,30H4.331C1.949,30,0,28.021,0,25.602V4.399C0,1.979,1.949,0,4.331,0 h51.338C58.052,0,60,1.979,60,4.399V25.602L60,25.602z M3.7,20.891c-1.285,0-2.461,3.811-2.461,5.116 c0,1.304,1.042,2.362,2.326,2.362s2.326-1.058,2.326-2.362C5.891,24.702,4.984,20.891,3.7,20.891z").attr({
    stroke: 'none',
    opacity: 0
  });
};
