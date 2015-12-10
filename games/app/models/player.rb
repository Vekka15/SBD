class Player < ActiveRecord::Base
  attr_accessor :team_name
  belongs_to :team
  validates :nickname, presence: true
  validates :name, presence: true
  validates :surname, presence: true
  validates :age, presence: true
  validates :team_name, presence: true
end
