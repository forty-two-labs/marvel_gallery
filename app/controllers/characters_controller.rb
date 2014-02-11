class CharactersController < ApplicationController
  def index
    @character = Character.order("RANDOM()").limit(8)
  end
end
