require 'rails_helper'

describe 'cards' do
  before :each do
     @deck_1 = Deck.create!(title: 'Words', description: 'Just some words.')
     @card_1 = Card.create!(question: 'la pregunta', answer: 'the question', deck_id: @deck_1.id)
     @card_2 = Card.create!(question: 'la respuesta', answer: 'the answer', deck_id: @deck_1.id)
   end

   it 'Only shows one card at a time' do
      visit("/decks/#{@deck_1.id}/cards")
      click_on 'Study'
      expect(current_path).to eq("/decks/#{@deck_1.id}/study/")

      expect(page).to have_content(@card_1.question)
      expect(page).to_not have_content(@card_2.question)
   end
end
