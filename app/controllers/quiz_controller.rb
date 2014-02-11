class QuizController < ApplicationController
  def show
    @character = Character.offset(rand(Character.count)).first
  end
end
