class Estate < ApplicationRecord
  # Associations
  has_many :rooms, dependent: :destroy

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :description, presence: true
  # Optional: Method to provide a full description or additional functionality
end
