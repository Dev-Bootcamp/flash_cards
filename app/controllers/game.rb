get '/user/:id/deck/:deckid' do 
  @user =    User.find(params[:id])
  @deck =    Deck.find(params[:deckid])
  @newcard = Deck.find(params[:deckid]).cards.first
  @round =   Round.create(user_id: params[:id], deck_id: params[:deckid])
  erb :game
end 

#=======POST===================

post '/user/:id/round/:roundid/deck/:deckid/card/:cardid' do
  @user =  User.find(params[:id])
  @deck =  Deck.find(params[:deckid])
  @round = Round.find(params[:roundid])
  @card =  Card.find(params[:cardid])
  new_card_id = @card.id + 1
  if @card.id < @deck.cards.last.id 
    @newcard = Card.find(new_card_id)
    @guess = Guess.log_guess(@card, @round, params[:answer])
    @result = Guess.check_answer(@guess, @card, @round)
    erb :game
  else 
    @guess = Guess.log_guess(@card, @round, params[:answer])
    @result = Guess.check_answer(@guess, @card, @round)
    @percentage_score = Guess.percentage(@round, @deck)
    @comment = Guess.comment(@percentage_score)
    erb :summary
  end 
end
