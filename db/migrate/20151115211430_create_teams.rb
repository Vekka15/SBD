class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :city
      t.string :symbol
      t.integer :level
      t.references :player, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
