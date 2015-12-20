class Game < ActiveRecord::Base
  has_many :match, :dependent => :restrict_with_error
  #before_destroy :check_for_match
  validates_presence_of :name, :message => "Nazwa jest wymagana"
  validates_presence_of :number_players, :message => "Liczba graczy jest wymagana"
  validates_presence_of :time, :message => "Czas jest wymagany"
  validates_presence_of :rate, :message => "Ocena jest wymagana"


end
