class Guess < ActiveRecord::Base
  belongs_to :round
  belongs_to :card


  def self.log_guess(card_id, round_id, answer)
    Guess.create(card_id: card_id, round_id: round_id, guess: answer)
  end


  def self.percentage(round, deck)
    (round.score / deck.cards.length.to_f) * 100
  end


  def self.check_answer(guess, card, round)
    if guess.guess.downcase == card.answer.downcase 
      newscore = round.score += 1
      round.update_attributes(score: newscore) 
      return "You are right"
    else 
      return "You are wrong"
    end
  end


  def self.comment(percentage_score)
    case percentage_score
    when 80..100
      return "You are a Genius"
    when 60..80
      return "You are pretty smart"
    when 40..60
      return "You have got work to do"
    when 20..40
      return "You are not very smart"
    when 1..20
      return "You are bad at this"
    else
      return "How did you get zero? Where have you been"
    end       
  end
end
