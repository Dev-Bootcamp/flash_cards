# create users
User.create(email: "tee@dev.com", password: "password")
User.create(email: "sean@dev.com", password: "password")


# create deck
Deck.create(name: "Capital cities")
Deck.create(name: "State abbreviations")

# create card
# deck 1 
Card.create(deck_id: 1, question: "Thailand", answer: "Bangkok")
Card.create(deck_id: 1, question: "USA", answer: "Washington, D.C.")
Card.create(deck_id: 1, question: "England", answer: "London")
Card.create(deck_id: 1, question: "France", answer: "Paris")
Card.create(deck_id: 1, question: "Gabon", answer: "Libreville")

# deck 2
Card.create(deck_id: 2, question: "Washington", answer: "WA")
Card.create(deck_id: 2, question: "Minnesota", answer: "MN")
Card.create(deck_id: 2, question: "California", answer: "CA")
Card.create(deck_id: 2, question: "Florida", answer: "FL")
Card.create(deck_id: 2, question: "Montana", answer: "MT")

