class Game < ActiveRecord::Base
  has_many :match
  before_destroy :check_for_match
  validates_presence_of :name, :message => "Nazwa jest wymagana"
  validates_presence_of :number_players, :message => "Liczba graczy jest wymagana"
  validates_presence_of :time, :message => "Czas jest wymagany"
  validates_presence_of :rate, :message => "Ocena jest wymagana"

  def check_for_match
    unless match.nil?
      self.errors[:base] << "Nie można usunąć jeżeli istnieją rozgrywki z tą grą."
      alert("Nie można usunąć jeżeli istnieją rozgrywki z tą grą.");
    end
  end
end
