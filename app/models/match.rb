class Match < ActiveRecord::Base
  belongs_to :game
  belongs_to :convention
  validates_presence_of :time, :message => "Czas jest wymagany"
  validates_presence_of :seats_number, :message => "Liczba miejsc jest wymagana"
  validates_presence_of :price,:message => "Nagroda jest wymagana"
  validates_presence_of :game_id,:message => "Gra jest wymagana"
  validates_presence_of :convention_id,:message => "Konwent jest wymagany"
end
