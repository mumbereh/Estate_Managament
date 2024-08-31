class RoomType < ApplicationRecord
  
  has_many :rooms

  validates :status_name, presence: true
  validates :description, presence: true
end
