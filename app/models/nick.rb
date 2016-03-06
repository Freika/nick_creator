class Nick < ActiveRecord::Base
  def self.generate(game, race, sex)
    name = generate_name(game, race, sex, surname: false, surname_slugs: 2)

    Nick.create(name: name)
  end

  def self.generate_name(game, race, sex, surname: false, surname_slugs: false)
    # TES Nords has only one surame_slug
    # TES Breton has two surame_slugs

    game = Game.find(game)
    race = Race.find(race)

    if game.name == 'The Elder Scrolls'
      case race.name
      when 'Nord'
        name = nord_name_and_surname(game, race, sex)
      when 'High Elf (Altmer)'
        name = name_without_surname(game, race, sex)
      when 'Argonian'
        name = name_without_surname(game, race, sex)
      when 'Wood Elf (Bosmer)'
        name = name_without_surname(game, race, sex)
      when 'Breton'
        name = breton_name(game, race, sex)
      when 'Khajiit'
        name = name_without_surname(game, race, sex)
      when 'Dark Elf (Dunmer)'
        name = name_with_simple_surname(game, race, sex)
      when 'Orc'
        name = orc_name(game, race, sex)
      when 'Redguard'
        name = name_without_surname(game, race, sex)
      else

      end

    elsif game.name == 'World of Warcraft'
      case race.name
      when 'Blood Elf'
        name = name_without_surname(game, race, sex)
      end
    end

    name
  end

  def self.name_without_surname(game, race, sex)
    name = %w(beginning middle end).map do |part|
      Syllable.where(part: part, game_id: game, race_id: race, sex: sex).pluck(:content).sample
    end.join.to_s
  end

  def self.breton_name(game, race, sex)
    name = name_without_surname(game, race, sex)

    surname = %w(surname_beginning surname_end).map do |part|
      Syllable.where(part: part, game_id: game, race_id: race, sex: sex).pluck(:content).sample
    end.join.to_s

    "#{name.capitalize} #{surname.capitalize}"
  end

  def self.name_with_simple_surname(game, race, sex)
    name = name_without_surname(game, race, sex)

    surname = Syllable.where(part: 'surname_beginning', game_id: game, race_id: race, sex: 'male').pluck(:content).sample

    "#{name.capitalize} #{surname}"
  end

  def self.nord_name_and_surname(game, race, sex)
    name = name_without_surname(game, race, sex)

    surname = Syllable.where(part: 'surname_beginning', game_id: game, race_id: race, sex: sex).pluck(:content).sample

    if rand > 0.5
      full_name = "#{name.capitalize} the #{surname}"
    elsif surname.present?
      full_name = "#{name.capitalize} #{surname}"
    else
      full_name = name.capitalize
    end

    full_name
  end

  def self.orc_name(game, race, sex)
    beginning = Syllable.where(part: 'beginning', game_id: game, race_id: race, sex: sex).pluck(:content).sample

    if beginning.size <= 4
      if rand > 0.8 && sex == 'male'
        middle = Syllable.where(part: 'middle', game_id: game, race_id: race, sex: sex).pluck(:content).sample
      else
        middle = ''
      end
      ending = Syllable.where(part: 'end', game_id: game, race_id: race, sex: sex).pluck(:content).sample

      name = "#{beginning}#{middle}#{ending}"
    else
      name = beginning
    end

    if rand > 0.5
      prefix = sex == 'male' ? 'gro-' : 'gra-'
      beginning = Syllable.where(part: 'beginning', game_id: game, race_id: race, sex: sex).pluck(:content).sample
      ending = Syllable.where(part: 'end', game_id: game, race_id: race, sex: sex).pluck(:content).sample
      surname = beginning + ending

      "#{name.capitalize} #{prefix}#{surname.capitalize}"
    else
      "#{name.capitalize}"
    end
  end
end
