require 'rails_helper'

RSpec.describe Deck do
  describe 'Validtions' do
    it {should validate_presence_of(:title)}
    # it {should validate_presence_of(:description)}
    #description is optional
  end
end
