class MlbPlayer < ApplicationRecord
   # Slugs
   extend FriendlyId
   friendly_id :name, use: :slugged
 
   # Validations
   validates :name, presence: true
   validates :team, presence: true
   validates :salary, presence: true, numericality: true

   def player_type
    'mlb'
  end

 end
 