class Team < ActiveRecord::Base
  has_many :player
  validates_presence_of :name, :message => "Nazwa jest wymagana"
  validates_presence_of :city, :message => "Miasto jest wymagane"
  validates_presence_of :symbol, :message => "Symbol jest wymagany"
  validates_presence_of :level, :message => "Poziom jest wymagany"
end
