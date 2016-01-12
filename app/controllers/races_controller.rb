class RacesController < ApplicationController
  def show
    @race = Race.find(params[:id])
    @game = @race.game
  end
end
