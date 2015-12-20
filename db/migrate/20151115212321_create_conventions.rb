class CreateConventions < ActiveRecord::Migration
  def change
    create_table :conventions do |t|
      t.string :name
      t.date :start
      t.date :end
      t.string :country
      t.integer :level

      t.timestamps null: false

    end

  end
end
