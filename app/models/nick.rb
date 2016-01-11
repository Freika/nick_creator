class Nick < ActiveRecord::Base
  def self.generate
    beginning = Syllable.where(part: 'beginning').pluck(:content).sample
    middle = Syllable.where(part: 'middle').pluck(:content).sample
    ending = Syllable.where(part: 'end').pluck(:content).sample

    name = "#{beginning.capitalize}#{middle}#{ending}"
    nick = Nick.create(name: name)
    nick.name
  end
end
