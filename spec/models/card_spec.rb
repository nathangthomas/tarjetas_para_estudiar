require 'rails_helper'

RSpec.describe Card do
  describe 'Validtions' do
    it {should validate_presence_of(:question)}
    it {should validate_presence_of(:answer)}
  end
  #
  # describe 'Instance Methods' do
  #   before :each do
  #     @card_1 = Card.new(question: 'la pregunta', answer: 'the question')
  #     @card_2 = Card.new(question: 'la respuesta', answer: 'the answer')
  #   end
  #
  #   expect(@card_1.question).to eq('la pregunta')
  #   expect(@card_2.question).to eq('la repuesta')
  # end
end
