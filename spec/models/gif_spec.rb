require "rails_helper"

describe Gif do
  it "exists" do
    word = 'cat'

    service = GiphyService.new
    gif_data = service.gif_by(word)
    parsed_gif_data = JSON.parse(gif_data.body, symbolize_names: true)

    gif = Gif.new(parsed_gif_data, word)

    expect(gif).to be_a Gif
    expect(gif.url).to eq("https://giphy.com/gifs/cat-funny-WXB88TeARFVvi")
    expect(gif.word).to eq('cat')
  end
end
