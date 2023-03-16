class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.string :age
      t.string :team
      t.decimal :salary

      t.timestamps
    end
  end
end
