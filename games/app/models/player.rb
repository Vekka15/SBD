class Player < ActiveRecord::Base
  belongs_to :team
  validates :nickname, presence: true
  validates :name, presence: true
  validates :surname, presence: true
  validates :age, presence: true
end
