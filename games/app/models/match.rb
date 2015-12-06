class Match < ActiveRecord::Base
  attr_accessor :game_name
  attr_accessor :convention_name
  belongs_to :game
  belongs_to :convention
end
