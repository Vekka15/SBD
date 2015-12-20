class Convention < ActiveRecord::Base
  #presence
  validates_presence_of :name, :message => "Nazwa jest wymagana", :allow_nil => true
  validates_presence_of :start, :message => "Czas startu jest wymagany"
  validates_presence_of :end, :message => "Czas zakończenia jest wymagany"
  validates_presence_of :country,:message => "Kraj jest wymagany", :allow_nil => true
  validates_presence_of :level, :message => "Poziom jest wymagany"

  #format
  validates_format_of :name, with: /\p{Alpha}/, :message => "Nazwa musi zawierać litery", :allow_blank => true
  validates_date :start, :invalid_date_message => "Start musi być datą", :allow_blank => true
  validates_date :end,:after => :start,:after_message => "Koniec musi być później niż start",:invalid_date_message => "Koniec jest niepoprawne",:allow_blank =>true
  validates_numericality_of :level,:less_than => 10, :message => "Poziom musi być mniejszy niż 10", :allow_blank => true
  validates_numericality_of :level, :only_integer => true, :message => "Poziom musi być liczbą", :allow_blank => true
  validates_format_of :country, with: /\p{Alpha}/, :message => "Państwo musi zawierać litery", :allow_blank => true

  #ograniczenie długości
  validates_length_of :name, :maximum => 15, :message => "Nazwa jest za długa" , :allow_blank => true
  validates_length_of :country, :maximum => 15,:message => "Kraj jest za długi", :allow_blank => true

  #unikalność
  validates_uniqueness_of :name, :message => "Nazwa już istnieje"

end
