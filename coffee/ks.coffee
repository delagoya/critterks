# c = require 'colors'

fs = {
  'font-family': "Helvetica Neue",
  'font-weight': "bold",
  'font-size': 18,
  fill: "#555",
  stroke: 'none',
  opacity: 0.5}

fw = {
  'font-family': "Helvetica Neue",
  'font-weight': "bold",
  'font-size': 18,
  fill: "url(images/swatches/white.jpg)",
  stroke: 'none'}

paper = Raphael("kickstarter", 300,60)

paper.text(69,10,"find out more @").attr(fs).transform("t0,1")
paper.text(69,10,"find out more @").attr(fw)
paper.rect(105,23,180,30,5).attr(fs).transform("t0,1")
paper.rect(105,23,180,30,5).attr(fw).attr({href: "http://www.kickstarter.com/projects/crittercase/1771170582?token=f181f8c4"})
paper.image("images/kickstarter.png",110,28,170,20).attr({href: "http://www.kickstarter.com/projects/crittercase/1771170582?token=f181f8c4"})