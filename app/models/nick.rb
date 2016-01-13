class Nick < ActiveRecord::Base
  def self.generate(game, race, sex)
    name = generate_name(game, race, sex, surname: true)

    Nick.create(name: name)
  end

  def self.generate_name(game, race, sex, surname: false)
    name = ''
    %w(beginning middle end).each do |part|
      name += Syllable.where(part: part, game_id: game, race_id: race, sex: sex).pluck(:content).sample
    end

    if surname.present?
      surname = Syllable.where(part: 'surname', game_id: game, race_id: race, sex: sex).pluck(:content).sample
      if rand > 0.5 && surname.present?
        name = "#{name.capitalize} the #{surname}"
      elsif surname.present?
        name = "#{name.capitalize} #{surname}"
      else
        name = name.capitalize
      end
    end

    name
  end
end
