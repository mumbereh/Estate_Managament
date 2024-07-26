class Tenant < ApplicationRecord
  belongs_to :room
  has_many :leases
  has_many :payments, through: :leases
end
