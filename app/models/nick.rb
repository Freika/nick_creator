class Nick < ActiveRecord::Base
  def self.generate(game, race, sex)
    name = generate_name(game, race, sex, surname: false, surname_slugs: 2)

    Nick.create(name: name)
  end

  def self.generate_name(game, race, sex, surname: false, surname_slugs: false)
    # TES Nords has only one surame_slug
    # TES Breton has two surame_slugs

    name = ''
    %w(beginning middle end).each do |part|
      name += Syllable.where(part: part, game_id: game, race_id: race, sex: sex).pluck(:content).sample
    end

    if surname.present? && surname_slugs.present?
      surname = Syllable.where(part: 'surname_beginning', game_id: game, race_id: race, sex: sex).pluck(:content).sample

      if surname_slugs > 1
        surname += Syllable.where(part: 'surname_end', game_id: game, race_id: race, sex: sex).pluck(:content).sample
      end

      if rand > 0.5 && surname.present? && surname_slugs == 1
        name = "#{name.capitalize} the #{surname}"
      elsif surname.present?
        name = "#{name.capitalize} #{surname}"
      else
        name = name.capitalize
      end
    else
      name.capitalize!
    end

    name
  end
end
