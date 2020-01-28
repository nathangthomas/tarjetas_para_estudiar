require 'rails_helper'

describe 'cards' do
  before :each do
     @card_1 = Card.create!(question: 'la pregunta', answer: 'the question')
     @card_2 = Card.create!(question: 'la respuesta', answer: 'the answer')
   end

   it 'Index' do
      visit("/cards")
      expect(page).to have_content("All Cards")
      expect(page).to have_content("Total Cards: 2")

      expect(page).to have_content("Card 1")
      expect(page).to have_content(@card_1.question)
      expect(page).to have_content(@card_1.answer)

      expect(page).to have_content("Card 2")
      expect(page).to have_content(@card_2.question)
      expect(page).to have_content(@card_2.answer)

      expect(page).to have_link("edit")
      expect(page).to have_link("delete")
   end

   it 'Show' do
     visit('/cards')
     click_link 'Card 1'
     expect(current_path).to eq(card_path(@card_1))

     expect(page).to have_link('all cards')
     expect(page).to have_content("Question: #{@card_1.question}")
     expect(page).to have_content("Answer: #{@card_1.answer}")
     expect(page).to have_link('edit')
     expect(page).to have_link('delete')
   end

   it 'Create, Edit, & Destroy' do
     visit('/cards')
     
     click_link 'Add A Card'
     fill_in :question, with: 'el codo'
     fill_in :answer, with: 'elbow'
     click_on 'Add Card'
     expect(page).to have_content("Question: el codo")

     click_link 'edit'
     fill_in :question, with: 'la rodilla'
     fill_in :answer, with: 'knee'
     click_on 'Update Card'
     expect(page).to have_content("Question: la rodilla")
     expect(page).to have_content("Answer: knee")

     click_on 'delete'
     expect(current_path).to eq(cards_path)
     expect(page).to_not  have_content("Question: la rodilla")
     expect(page).to_not  have_content("Answer: knee")
   end
end
