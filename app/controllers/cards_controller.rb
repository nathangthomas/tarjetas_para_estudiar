class CardsController < ApplicationController

  def index
    if params[:deck_id].nil?
      @cards = Card.all
    else
      @deck = Deck.find(params[:deck_id])
      @items = @deck.cards
    end
  end

  def show
    @card = Card.find(params[:id])
  end

  def new
    @deck = Deck.find(params[:deck_id])
  end

  def create
    @deck = Deck.find(params[:deck_id])
    # @card = @deck.cards.last.id + 1
    @deck.cards.create(card_params)

    redirect_to deck_path(@deck.id)
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    @card.update(card_params)

    redirect_to deck_card_path(params[:deck_id], @card)
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to deck_cards_path(params[:deck_id])
  end


  def flop
    @card = Card.find(params[:card_id])
    @card.correct = true
    @card.save
    redirect_to deck_study_index_path(params[:deck_id])
  end

  def back
    @card = Card.find(params[:card_id])
    @card.correct = false
    @card.save
    redirect_to deck_study_index_path(params[:deck_id])
  end

  private

  def card_params
    params.permit(:question, :answer, :deck_id)
  end

end
