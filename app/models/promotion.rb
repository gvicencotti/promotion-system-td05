class Promotion < ApplicationRecord
  validates :name, :discount_rate, :code, :coupon_quantity, :expiration_date, presence: true
  validates :code, uniqueness: true
end
