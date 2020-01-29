require 'rails_helper'

describe 'cards' do
  before :each do
     @deck_1 = Deck.create!(title: 'Words', description: 'Just some words.')
     @card_1 = Card.create!(question: 'la pregunta', answer: 'the question', deck_id: @deck_1.id)
     @card_2 = Card.create!(question: 'la respuesta', answer: 'the answer', deck_id: @deck_1.id)
   end

   it 'Index' do
      visit("/decks/#{@deck_1.id}/cards")

      expect(page).to have_content(@card_1.question)
      expect(page).to have_content(@card_1.answer)

      expect(page).to have_content(@card_2.question)
      expect(page).to have_content(@card_2.answer)

      expect(page).to have_link("edit")
      expect(page).to have_link("delete")
   end

   it 'Show' do
     visit("/decks/#{@deck_1.id}/cards/#{@card_1.id}")
     expect(current_path).to eq(deck_card_path(@deck_1.id, @card_1))

     expect(page).to have_link('All Cards')
     expect(page).to have_content("#{@card_1.question}")
     expect(page).to have_content("#{@card_1.answer}")
     expect(page).to have_link('edit')
     expect(page).to have_link('delete')
   end

   it 'Create, Edit, & Destroy' do
     visit("/decks/#{@deck_1.id}")
     click_link 'Add A Card'
     fill_in :question, with: 'el codo'
     fill_in :answer, with: 'elbow'
     click_on 'Add Card'
     expect(page).to have_content("el codo")

     click_link 'edit'
     fill_in :question, with: 'la rodilla'
     fill_in :answer, with: 'knee'
     click_on 'Update Card'
     expect(page).to have_content("la rodilla")
     expect(page).to have_content("knee")

     click_on 'delete'
     expect(current_path).to eq("/decks/#{@deck_1.id}/cards")
     expect(page).to_not  have_content("la rodilla")
     expect(page).to_not  have_content("knee")
   end
end
