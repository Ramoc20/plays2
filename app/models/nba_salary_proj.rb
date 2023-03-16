class NbaSalaryProj < ApplicationRecord
   self.table_name = "nba_salary_proj"
   belongs_to :player
 end
 
 