class Match < ActiveRecord::Base
  belongs_to :game
  belongs_to :convention
  has_many :participation

  #presence
  validates_presence_of :time, :message => "Czas jest wymagany"
  validates_presence_of :seats_number, :message => "Liczba miejsc jest wymagana"
  validates_presence_of :price,:message => "Nagroda jest wymagana"
  validates_presence_of :game_id,:message => "Gra jest wymagana"
  validates_presence_of :convention_id,:message => "Konwent jest wymagany"

  #format
  validates_numericality_of :time, :integer_only => true, :message => "Czas musi być liczbą", :allow_blank => true
  validates_numericality_of :time, :less_than => 10, :message => "Czas musi być mniejszy niż 10", :allow_blank => true
  validates_numericality_of :seats_number, :less_than => 10, :message => "Liczba miejsc taka jak gry", :allow_blank => true #do pr
  validates_numericality_of :price, :integer_only => true, :message => "Cena musi być liczbą", :allow_blank => true


end
