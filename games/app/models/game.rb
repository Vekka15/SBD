class Game < ActiveRecord::Base
  validates :name, presence: true
  validates :number_players, presence: true
  validates :time, presence: true
  validates :rate, presence: true
end
