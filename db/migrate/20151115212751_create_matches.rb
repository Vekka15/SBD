class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.decimal :time
      t.integer :seats_number
      t.decimal :price
      t.references :game, index: true, foreign_key: true
      t.references :convention, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
