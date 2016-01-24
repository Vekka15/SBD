class Player < ActiveRecord::Base
  belongs_to :team
  has_many :participation
  before_destroy :check_for_participations

  #presence
  validates_presence_of :nickname, :message => "Nick jest wymagany", :allow_nil => true
  validates_presence_of :name, :message => "Nazwa jest wymagana", :allow_nil => true
  validates_presence_of :surname, :message => "Nazwisko jest wymagane", :allow_nil => true
  validates_presence_of :age, :message => "Wiek jest wymagany"
  validates_presence_of :team_id, :message => "Drużyna jest wymagana"

  #format
  validates_format_of :nickname, with: /\p{Alpha}/, :message => "Nick musi zawierać litery", :allow_blank =>true
  validates_format_of :name, with: /\p{Alpha}/, :message => "Imię musi zawierać litery", :allow_blank => true
  validates_format_of :surname, with: /\p{Alpha}/, :message => "Nazwisko musi zawierać lietry", :allow_blank =>true
  validates_numericality_of :age, :integer_only => true, :message => "Wiek musi być liczbą", :allow_blank => true
  validates_numericality_of :age, :less_than => 100, :message => "Wiek musi być mniejszy niż 100", :allow_blank => true

  #unikatowość

  #długość
  validates_length_of :nickname, :maximum => 15, :message => "Nick jest za długi", :allow_blank => true
  validates_length_of :name, :maximum => 15, :message => "Imię jest za długie", :allow_blank => true
  validates_length_of :surname, :maximum => 15, :message => "Nazwisko jest za długie", :allow_blank =>true

  private

  def check_for_participations
    if participation.any?
      return false
    end
  end
end
