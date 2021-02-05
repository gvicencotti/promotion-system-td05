class Promotion < ApplicationRecord
  has_many :coupons
  
  validates :name, :discount_rate, :code, :coupon_quantity, :expiration_date, presence: true
  validates :code, uniqueness: true

  def generate_coupons!
    Coupon.transaction do
      (1..coupon_quantity).each do |number|
        coupons.create!(code: "#{code}-#{'%04d' % number}")
      end
    end
  end
end
