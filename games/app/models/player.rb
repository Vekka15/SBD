class Player < ActiveRecord::Base
  attr_accessor :team_name
  belongs_to :team
end
