class Team < ActiveRecord::Base
  has_many :player

  #presence
  validates_presence_of :name, :message => "Nazwa jest wymagana", :allow_nil => true
  validates_presence_of :city, :message => "Miasto jest wymagane", :allow_nil => true
  validates_presence_of :symbol, :message => "Symbol jest wymagany", :allow_nil => true
  validates_presence_of :level, :message => "Poziom jest wymagany"

  #format
  validates_format_of :name, with: /\p{Alpha}/, :message => "Nazwa musi zawierać litery", :allow_blank => true
  validates_format_of :city, with: /\p{Alpha}/, :message => "Miasto musi zawierać litery", :allow_blank =>true
  validates_format_of :symbol, with: /\p{Alpha}/, :message => "Symbol musi zawierać litery", :allow_blank =>true

  #unikalnosc
  validates_uniqueness_of :name, :message => "Drużyna o takiej nazwie istnieje"

  #długość
  validates_length_of :name, :maximum => 15, :message => "Nazwa jest za długa"
  validates_length_of :city, :maximum => 15, :message => "Miasto jest za długie"
  validates_length_of :symbol, :maximum => 15, :message => "Symbol jest za długi"

end
