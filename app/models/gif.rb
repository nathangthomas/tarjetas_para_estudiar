class Gif
  attr_reader :id, :word, :url

  def initialize(parsed_data, word)
    @id = rand(0..999)
    @gif_data = parsed_data
    @url = giphy_url
    @word = word
  end

  def giphy_url
    @gif_data[:data][0][:url]
  end
end
