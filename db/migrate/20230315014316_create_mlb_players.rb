class CreateMlbPlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :mlb_players do |t|
      t.string :name
      t.string :position
      t.string :team
      t.integer :salary
      t.date :date_of_birth
      t.string :slug

      t.timestamps
    end
  end
end
