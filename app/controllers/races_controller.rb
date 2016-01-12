class RacesController < ApplicationController
  def show
    @race = Race.friendly.find(params[:id])
    @game = @race.game
  end
end
