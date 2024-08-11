class Room < ApplicationRecord
  belongs_to :estate
  has_many :tenants
  belongs_to :room_type

  validates :room_type_id, presence: true
  validates :room_number, presence: true, uniqueness: { case_sensitive: false }
  validates :estate_id, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  before_validation :strip_whitespace

  private

  def strip_whitespace
    self.room_number = room_number.strip unless room_number.nil?
  end
end
