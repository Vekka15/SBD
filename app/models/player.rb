class Player < ActiveRecord::Base
  belongs_to :team
  validates_presence_of :nickname, :message => "Nick jest wymagany"
  validates_presence_of :name, :message => "Nazwa jest wymagana"
  validates_presence_of :surname, :message => "Nazwisko jest wymagane"
  validates_presence_of :age, :message => "Wiek jest wymagany"
end
