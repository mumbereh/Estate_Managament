class Tenant < ApplicationRecord
  
  belongs_to :room
  has_many :leases
  has_many :payments, through: :leases
  
  validates :first_name, :last_name, :home_district, :village, :next_of_kin, presence: true
  validates :room_id, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def full_name
    "#{first_name} #{last_name}"
  end
end
