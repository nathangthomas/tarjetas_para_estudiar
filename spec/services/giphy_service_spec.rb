require "rails_helper"

describe GiphyService do
  context 'instance methods' do
    it "returns a gif associated with a word" do

      gif_data = subject.gif_by('cat')
      gif = JSON.parse(gif_data.body, symbolize_names: true)

      expect(gif).to be_an Hash
      expect(gif[:data][0][:url]).to eq("https://giphy.com/gifs/cat-funny-WXB88TeARFVvi")
    end
  end
end
