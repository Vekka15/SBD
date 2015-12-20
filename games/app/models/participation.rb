class Participation < ActiveRecord::Base
  belongs_to :match
  belongs_to :player
  # validates_presence_of :player_id,:message => "Gracz jest wymagany"
  validates_presence_of :match_id, :message => "Rozgrywka jest wymagana"
end
