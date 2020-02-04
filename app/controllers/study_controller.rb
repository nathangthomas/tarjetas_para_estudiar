class StudyController < ApplicationController

  def index
    @deck = Deck.find(params[:deck_id])
    @cards = @deck.cards
    correct_cards = []
    @correct_count = 0
    incorrect_cards = []
    @incorrect_count = 0

    @cards.map do |card|
      if card.correct == true
        correct_cards << card
        @correct_count += 1
      else
        incorrect_cards << card
        @incorrect_count += 1
      end
    end

    if @correct_count == @cards.length
        @cards.each do |card|
          card.correct = false
          card.save
        end
      redirect_to decks_path
    else
      @current_card = Card.where(correct: false).first
    end
  end
  
end
