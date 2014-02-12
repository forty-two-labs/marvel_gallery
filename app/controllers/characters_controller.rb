class CharactersController < ApplicationController
  def index
    @character = Character.where("thumbnail_image_url != 'http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg'").order("RANDOM()").limit(8)
  end
  
end
