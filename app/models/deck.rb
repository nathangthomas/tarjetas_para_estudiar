class Deck < ApplicationRecord

  has_many :cards
  validates_presence_of :title
end
