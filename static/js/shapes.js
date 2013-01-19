
Raphael.fn.pointyTooth = function(x, y) {
  return this.path("M" + x + "," + y + " l20,0 l-20,30 l-20,-30z");
};

Raphael.fn.squareTooth = function(x, y) {
  return this.path("M" + x + "," + y + " l27,0 l0,25 t-2,2 l-23,0 t-2,-2 z");
};
