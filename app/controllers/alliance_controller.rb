class AllianceController < ApplicationController
  def show
    @character = Character.offset(rand(Character.count)).first
  end
  
  def update
    @character = Character.find(params[:id])
    params[:hero]
    params[:evil]
  end
end
