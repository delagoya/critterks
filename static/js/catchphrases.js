// Generated by CoffeeScript 1.4.0
var bubble, createPhrase, paper, phrases;

phrases = ['You complete me.', 'Share the <3!', 'Queso Blanco', 'Wut da wut?', 'Sweet!', 'Dude, where\'s my phone?'];

paper = Raphael.paper('rightPanel', 160, 60);

createPhrase = function(phrase) {
  return paper.text(0, 0, phrase);
};

bubble = function(phrase) {
  return phrase;
};
