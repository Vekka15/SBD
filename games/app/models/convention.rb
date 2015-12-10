class Convention < ActiveRecord::Base
  validates :name, presence: true
  validates :start, presence: true
  validates :end, presence: true
  validates :country,presence: true
  validates :level, presence: true
end
