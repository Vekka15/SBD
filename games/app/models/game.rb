class Game < ActiveRecord::Base
  validates_presence_of :name, :message => "Nazwa jest wymagana"
  validates_presence_of :number_players, :message => "Liczba graczy jest wymagana"
  validates_presence_of :time, :message => "Czas jest wymagany"
  validates_presence_of :rate, :message => "Ocena jest wymagana"
end
