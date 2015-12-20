class Game < ActiveRecord::Base
  has_many :match, :dependent => :restrict_with_error

  #presence
  validates_presence_of :name, :message => "Nazwa jest wymagana", :allow_nil => true
  validates_presence_of :number_players, :message => "Liczba graczy jest wymagana", :allow_nil => true
  validates_presence_of :time, :message => "Czas jest wymagany"
  validates_presence_of :rate, :message => "Ocena jest wymagana"

  #format
  validates_format_of :name, :with /\p{Alpha}/, :message => "Nazwa musi zawierać litery", :allow_blank => true
  validates_numericality_of :number_player,:integer_only => true, :message => "Liczba graczy musi być liczbą", :allow_blank => true
  validates_numericality_of :number_player,:less_than => 20, :message => "Liczba graczy musi być mniejsza niż 20", :allow_blank => true
  validates_numericality_of :time, :message => "Czas musi być liczbą", :allow_blank => true #zastanowic sie nad tym
  validates_numericality_of :rate, :integer_only => true, :message => "Ocena musi być liczbą", :allow_blank => true
  validates_numericality_of :rate, :less_than => 10, :message => "Ocena musi być mniejsza niż 10", :allow_blank => true

  #unikalność
  validates_uniqueness_of :name, :message => "Nazwa już istnieje", :allow_blank => true
  
end
