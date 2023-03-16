class NbaContractInfo < ApplicationRecord
  self.table_name = "nba_contract_info"
  belongs_to :player
end
