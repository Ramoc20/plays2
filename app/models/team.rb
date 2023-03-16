class Team < ApplicationRecord
  belongs_to :category
  extend FriendlyId
  friendly_id :name, use: :slugged
end
