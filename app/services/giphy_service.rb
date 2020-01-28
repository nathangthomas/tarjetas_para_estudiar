class GiphyService

  def gif_by(word)
    Faraday.get "https://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_API_KEY"]}&limit=1&q=#{word}"
  end

end
