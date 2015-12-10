class Team < ActiveRecord::Base
  has_many :player
  validates :name, presence: true
  validates :city, presence: true
  validates :symbol, presence: true
  validates :level, presence: true
end
