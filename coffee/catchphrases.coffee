phrases = [
  'You complete me.',
  'Share the <3!',
  'Queso Blanco',
  'Wut da wut?',
  'Sweet!', 
  'Dude, where\'s my phone?'
]
paper = Raphael.paper('rightPanel', 160,60)
createPhrase = (phrase) -> 
  return paper.text(0,0,phrase)
bubble = (phrase) -> 
  phrase