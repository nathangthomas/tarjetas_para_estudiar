class FlikrFacade
  attr_reader :id

  def initialize(word)
    @id = rand(0..999)
    @word = word
  end

  def word_image
    Image.new(image_for(@word))
  end
  private

  def image_for(word)
    @_image_for ||= flickr_service
  end

  def flickr_service
    FlickrService.new.image_of(@word)
  end

end
