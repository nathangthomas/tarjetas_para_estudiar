require 'rails_helper'

RSpec.describe Card do
  describe 'Validtions' do
    it {should validate_presence_of(:question)}
    it {should validate_presence_of(:answer)}
  end
end
