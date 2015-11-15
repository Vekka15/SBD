class Match < ActiveRecord::Base
  belongs_to :game
  belongs_to :convention
end
