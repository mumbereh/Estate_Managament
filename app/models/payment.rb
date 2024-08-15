class Payment < ApplicationRecord
  belongs_to :lease
  has_one :tenant, through: :lease

  before_save :calculate_balance_and_months_covered

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :payment_date, presence: true

  private

  def calculate_balance_and_months_covered
    monthly_rent = lease.monthly_rent.to_d
    payment_amount = amount.to_d

  
    self.balance ||= 0.to_d


    self.months_covered = (payment_amount / monthly_rent).to_i
    remainder = payment_amount % monthly_rent


    if remainder > 0 && payment_amount < monthly_rent
      self.balance = monthly_rent - payment_amount
      self.amount_due_next_month = self.balance + monthly_rent
      self.balance_carried_forward = 0.to_d
    else
      self.amount_due_next_month = 0.to_d
      self.balance = 0.to_d
      self.balance_carried_forward = remainder
    end

    self.start_month = Date.today.beginning_of_month
    self.end_month = self.start_month + self.months_covered.months - 1.day
  end
end
