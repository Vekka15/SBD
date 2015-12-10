class Match < ActiveRecord::Base
  attr_accessor :game_name
  attr_accessor :convention_name
  belongs_to :game
  belongs_to :convention
  validates :time,presence: true
  validates :seats_number,presence: true
  validates :price,presence: true
  validates :game_name,presence: true
  validates :convention_name,presence: true
end
