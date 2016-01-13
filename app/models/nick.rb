class Nick < ActiveRecord::Base
  def self.generate_nord(game, race, sex)
    beginning = Syllable.where(part: 'beginning', game_id: game, race_id: race, sex: sex).pluck(:content).sample
    middle = Syllable.where(part: 'middle', game_id: game, race_id: race, sex: sex).pluck(:content).sample
    ending = Syllable.where(part: 'end', game_id: game, race_id: race, sex: sex).pluck(:content).sample

    surname = Syllable.where(part: 'surname', game_id: game, race_id: race, sex: sex).pluck(:content).sample

    if rand > 0.5
      name = "#{beginning.capitalize}#{middle}#{ending} the #{surname}"
    else
      name = "#{beginning.capitalize}#{middle}#{ending} #{surname}"
    end
    Nick.create(name: name)
  end
end
