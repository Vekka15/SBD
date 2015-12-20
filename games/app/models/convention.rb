class Convention < ActiveRecord::Base
  validates_presence_of :name, :message => "Nazwa jest wymagana"
  validates_presence_of :start, :message => "Czas staru jest wymagany"
  validates_presence_of :end, :message => "Czas zakończenia jest wymagany"
  validates_presence_of :country,:message => "Kraj jest wymagany"
  validates_presence_of :level, :message => "Poziom jest wymagany"
end
