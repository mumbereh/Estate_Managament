class Estate < ApplicationRecord
    has_many :rooms
    has_many :tenants, through: :rooms

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :description, presence: true
  # Optional: Method to provide a full description or additional functionality
end
