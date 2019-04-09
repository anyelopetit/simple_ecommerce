class Seller < ApplicationRecord
  has_many :products, dependent: :destroy

  has_many :sellers_payments
  has_many :payments, through: :sellers_payments

  def gained_money(_date)
    if date
      products = products.includes(:purchases).where(
        purchases: { created_at: date }
      )
    end
    products.includes(:purchases).inject(0) do |sum, product|
      sum + product.purchases&.map { |p| p.product_price.to_f }.sum
    end
  end

  def lost_money
    products.includes(:refunds).inject(0) do |sum, product|
      sum + product.refunds&.map { |f| f.purchase_price.to_f }.sum
    end
  end

  def balance
    gained_money - lost_money
  end

  def charge_at(charge_date)
    products.includes(:purchases).inject(0) do |charged, product|
      purchases =
        product.purchases&.select { |p| p.created_at.eql?(charge_date) }
      charged + purchases&.map { |p| p.product_price.to_f }.sum
    end
  end
end
