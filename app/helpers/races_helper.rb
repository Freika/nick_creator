module RacesHelper
  def active_race(race)
    'active' if params[:id] == race
  end
end
