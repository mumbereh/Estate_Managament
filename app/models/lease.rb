class Lease < ApplicationRecord
  belongs_to :tenant
  belongs_to :room
  has_many :payments

  validates :start_date, :end_date, :monthly_rent, presence: true
  validate :end_date_after_start_date, :monthly_rent_matches_room_price

  def end_date_after_start_date
    if end_date <= start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  def monthly_rent_matches_room_price
    if room.present? && monthly_rent != room.price
      errors.add(:monthly_rent, "must match the room price")
    end
  end

  # Calculate the duration in months from start_date to end_date
  def duration_in_months
    return 0 if start_date.blank? || end_date.blank?

    ((end_date.year * 12 + end_date.month) - (start_date.year * 12 + start_date.month)).to_i + 1
  end

  # Calculate the total amount based on the duration and monthly rent
  def total_amount
    duration_in_months * monthly_rent
  end

  # Calculate the total amount paid based on associated payments
  def total_amount_paid
    payments.sum(:amount)
  end

  # Calculate the number of months for which the rent has been paid
  def number_of_months_paid
    return 0 if monthly_rent.zero?

    (total_amount_paid / monthly_rent).to_i
  end

  # Provide a description of the lease
  def lease_description
    tenant_name = "#{tenant.first_name} #{tenant.last_name}"
    "Tenant: #{tenant_name}, Room: #{room.room_number}, Rent: #{monthly_rent}"
  end
end
