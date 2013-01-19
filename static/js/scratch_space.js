window.onload = function() {
var shadow = {
  width: 2,
  fill: false,
  opacity: 0.5,
  offsetx: 0,
  offsety: 1,
  color: '#555',
  stroke: 'none'

};

var shadow2 = {
  width: 1,
  fill: false,
  opacity: 0.4,
  offsetx: 0,
  offsety: 1,
  color: '#555',
  stroke: 'none'
};


//skin
paper = Raphael("skin",620,310);
// eye white fill
var ea = {  fill: "url(images/swatches/white.jpg)",   stroke: "none" };
// var skin = paper.rect(0,0,610,300,30).attr({fill: "url(images/swatches/green.jpg)", stroke: "none"}).glow(shadow);
var  skin = paper.path("M314.18,131.986c0,12.473-10.205,22.677-22.677,22.677H22.677C10.205,154.663,0,144.458,0,131.986V22.677 C0,10.205,10.205,0,22.677,0h268.825c12.473,0,22.677,10.205,22.677,22.677V131.986z M19.372,107.702 c-6.726,0-12.885,19.645-12.885,26.372c0,6.726,5.453,12.179,12.179,12.179c6.727,0,12.18-5.453,12.18-12.179 C30.846,127.347,26.099,107.702,19.372,107.702z").attr({
    fill: "url(images/swatches/pink.jpg)",
    stroke: "none"
}).transform("S1.91T157,85");

var e1  =  paper.circle(310,100,60).attr(ea).glow(shadow);
var e2  =  paper.circle(200,120,40).attr(ea).glow(shadow);
var e2  =  paper.circle(420,120,40).attr(ea).glow(shadow);

var er = {  fill: "url(images/swatches/red.jpg)",   stroke: "none" };

var eb1 = paper.circle(310,100,18).attr(er);
eb1.glowing = eb1.glow(shadow2);

var eb2 = paper.circle(190,130,10).attr(er).glow(shadow2);
var eb3 = paper.circle(440,130,10).attr(er).glow(shadow2);

eb1.drag(function (dx,dy,x,y,e){ 
  this.attr({
    cx: e.offsetX,
    cy: e.offsetY,
    r: 18
  });
});

};
