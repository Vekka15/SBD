class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.references :match, index: true, foreign_key: true
      t.references :player, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
