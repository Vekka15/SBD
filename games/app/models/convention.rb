class Convention < ActiveRecord::Base
  validates :name, presence: true
end
