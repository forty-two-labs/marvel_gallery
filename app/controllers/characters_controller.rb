class CharactersController < ApplicationController
  def index
    @character = Character.take(5)
  end
end
