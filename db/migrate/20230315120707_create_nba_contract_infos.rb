class CreateNbaContractInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :nba_contract_infos do |t|
      t.references :player, null: false, foreign_key: true
      t.string :player_name
      t.integer :con_years
      t.decimal :amount
      t.string :team

      t.timestamps
    end
  end
end
