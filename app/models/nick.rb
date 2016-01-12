class Nick < ActiveRecord::Base
  def self.generate(game, race, sex)
    beginning = Syllable.where(part: 'beginning', game_id: game, race_id: race, sex: sex).pluck(:content).sample
    middle = Syllable.where(part: 'middle', game_id: game, race_id: race, sex: sex).pluck(:content).sample
    ending = Syllable.where(part: 'end', game_id: game, race_id: race, sex: sex).pluck(:content).sample

    name = "#{beginning.capitalize}#{middle}#{ending}"
    Nick.create(name: name)
  end
end
