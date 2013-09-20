

get '/user/:id/deck/:deckid' do 
  @user = User.find(params[:id])
  @deck = Deck.find(params[:deckid])
  @newcard = Deck.find(params[:deckid]).cards.first
  @round = Round.create(user_id: params[:id], deck_id: params[:deckid])
  erb :game
end 

post '/user/:id/round/:roundid/deck/:deckid/card/:cardid' do
  @user = User.find(params[:id])
  @deck = Deck.find(params[:deckid])
  @round = Round.find(params[:roundid])
   
  @card = Card.find(params[:cardid])
  newcardid = @card.id + 1
  if @card.id < @deck.cards.last.id 
    @newcard = Card.find(newcardid)
    @guess  = Guess.create(card_id: params[:cardid], round_id: params[:roundid], guess: params[:answer])
    if @guess.guess == @card.answer 
      @round.score += 1 
      erb :game
    else 
      erb :game
    end 
  else 
    erb :summary
  end 
end
