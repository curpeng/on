class DealersController < ApplicationController
  def index
    @dealers = Dealer.first(50)
  end
end
