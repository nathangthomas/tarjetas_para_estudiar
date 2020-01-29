require 'rails_helper'

describe 'decks' do
  before :each do
     @deck_1 = Deck.create!(title: 'Numbers', description: 'Numbers 1 - 10 in Spanish')
     @deck_2 = Deck.create!(title: 'Verbs')
   end

   it 'Index' do
      visit("/decks")
      expect(page).to have_content("You have 2 decks")
      expect(page).to have_link("Add A Deck")


      expect(page).to have_content(@deck_1.title)
      expect(page).to have_content(@deck_1.description)


      expect(page).to have_content(@deck_2.title)

      expect(page).to have_link("edit")
      expect(page).to have_link("delete")
   end
   #
   # it 'Show' do
   #   visit('/cards')
   #   click_link 'Card 1'
   #   expect(current_path).to eq(card_path(@card_1))
   #
   #   expect(page).to have_link('all cards')
   #   expect(page).to have_content("Question: #{@card_1.question}")
   #   expect(page).to have_content("Answer: #{@card_1.answer}")
   #   expect(page).to have_link('edit')
   #   expect(page).to have_link('delete')
   # end
   #
   # it 'Create, Edit, & Destroy' do
   #   visit('/cards')
   #
   #   click_link 'Add A Card'
   #   fill_in :question, with: 'el codo'
   #   fill_in :answer, with: 'elbow'
   #   click_on 'Add Card'
   #   expect(page).to have_content("Question: el codo")
   #
   #   click_link 'edit'
   #   fill_in :question, with: 'la rodilla'
   #   fill_in :answer, with: 'knee'
   #   click_on 'Update Card'
   #   expect(page).to have_content("Question: la rodilla")
   #   expect(page).to have_content("Answer: knee")
   #
   #   click_on 'delete'
   #   expect(current_path).to eq(cards_path)
   #   expect(page).to_not  have_content("Question: la rodilla")
   #   expect(page).to_not  have_content("Answer: knee")
   # end
end
