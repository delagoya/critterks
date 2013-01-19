Raphael.fn.pointyTooth = (x, y) -> 
  this.path("M#{x},#{y} l20,0 l-20,30 l-20,-30z")
Raphael.fn.squareTooth = (x, y) -> 
  this.path("M#{x},#{y} l27,0 l0,25 t-2,2 l-23,0 t-2,-2 z")
