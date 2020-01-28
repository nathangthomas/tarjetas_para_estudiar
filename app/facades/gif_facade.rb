class GifFacade
  attr_reader :id

  def initialize(word)
    @id = rand(0..99)
    @word = word
  end

  def get_gif
    gif_for(@word)
  end

private

  def gif_for(word)
    gif_data = GiphyService.new.gif_by(word)
    parsed_data = JSON.parse(gif_data.body, symbolize_names: true)
    Gif.new(parsed_data, word)
  end

end
