class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :nickname
      t.string :status
      t.integer :ranking
      t.string :avatar

      t.timestamps
    end
  end
end
