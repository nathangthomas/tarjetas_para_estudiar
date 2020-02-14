# class EndController < ApplicationController
#
#   def index
#     @deck = Deck.find(params[:deck_id])
#     @cards = @deck.cards
#     @correct_count = @cards.where(correct: true).count
#     @incorrect_count = @deck.incorrect_count
#
#     one_hundred = ['congratulations', 'you rock', 'totally awesome', 'hell yes', "rock `n roll", 'kick ass']
#     point_75 = ['not bad', 'just missed it', 'almost']
#     point_50 = ['pick it up a notch', 'sorry, try again', 'you loose']
#     @congratz = one_hundred.shuffle.first
#     @you_done_well = point_75.shuffle.first
#     @try_again = point_50.shuffle.first
#
#   end
# end
