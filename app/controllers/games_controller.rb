class GamesController < ApplicationController
  def show
    @game = Game.friendly.find(params[:id])
  end

  def index
  end
end
