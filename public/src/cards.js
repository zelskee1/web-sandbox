const figures = ['valet', 'dame', 'roi', 'as'];
const suits = ['pique', 'coeur', 'carreau', 'trefle'];

const cards_images = {};


function generateDeck() {
  const deck = [];

  for (let suit of suits) {
    // Ajouter les cartes numérotées
    for (let n = 2; n <= 10; n++) {
      deck.push(n + suit);
      cards_images[""+n+suit] = `images/cards_set/${n}${suit}.png`;
    }
    // Ajouter les figures
    for (let f of figures) {
      deck.push(f + suit);
      cards_images[""+f+suit] = `images/cards_set/${f}${suit}.png`;
    }
  }

  return deck;
}

function shuffleDeck(deck) {
  for (let i = deck.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [deck[i], deck[j]] = [deck[j], deck[i]]; 
  }
}

function drawCard(deck){
  return deck.pop();
}



