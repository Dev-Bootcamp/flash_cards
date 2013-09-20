

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
    if @guess.guess.downcase == @card.answer.downcase 
      @result = "You are right"
      newscore = @round.score += 1
      @round.update_attributes(score: newscore) 
      erb :game
    else 
      @result = "You are wrong"
      erb :game
    end 
  else 
    @guess  = Guess.create(card_id: params[:cardid], round_id: params[:roundid], guess:params[:answer])
    if @guess.guess.downcase == @card.answer.downcase
      newscore = @round.score += 1
      @round.update_attributes(score: newscore)
    end 

    @percentage_score = (@round.score / @deck.cards.length.to_f) * 100

    case @percentage_score
    when 80..100
      @comment = "You are Genius"
    when 60..80
      @comment = "You are pretty smart"
    when 40..60
      @comment = "You have got work to do"
    when 20..40
      @comment = "You are not very smart"
    when 1..20
      @comment = "You are bad at this"
    else
      @comment = "How did you get zero !? Where have you been"
    end       

    erb :summary
  end 
end
