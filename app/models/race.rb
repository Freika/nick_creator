class Race < ActiveRecord::Base
  belongs_to :game
  has_many :syllables
end
