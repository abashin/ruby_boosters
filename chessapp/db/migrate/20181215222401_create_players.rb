class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :lastname
      t.integer :birth
      t.integer :dead
      t.integer :start
      t.integer :stop
      t.string :image

      t.timestamps
    end
  end
end
