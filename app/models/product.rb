class Product < ApplicationRecord
  belongs_to :seller
  has_many :purchases, dependent: :destroy
  has_many :refunds, dependent: :destroy, through: :purchases

  def purchases_money
    purchases&.map { |p| p.product_price.to_i }.sum
  end

  def refunded_money
    refunds&.map { |p| p.purchase_price.to_i }.sum
  end

  def balance
    purchases_money - refunded_money
  end
end
