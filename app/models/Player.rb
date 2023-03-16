class Player < ApplicationRecord
  has_one :nba_contract_info
  has_many :nba_salary_proj
  has_many :career_data

  # Associations


  # Slugs
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Validations
  validates :name, presence: true
  validates :team, presence: true
  validates :salary, presence: true, numericality: true

  # Attributes
  attribute :position, :string
  attribute :date_of_birth, :date
  attribute :current_team, :string
  attribute :team, :string

  def player_type
    'nba'
  end

  def age
    return nil if date_of_birth.nil?
    ((Time.zone.now - date_of_birth.to_time) / 1.year.seconds).floor
  end
end
