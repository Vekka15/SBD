class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.integer :number_players
      t.integer :time
      t.integer :rate

      t.timestamps null: false
    end
  end
end
