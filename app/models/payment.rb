class Payment < ApplicationRecord
  has_many :sellers_payments
  has_many :sellers, through: :sellers_payments
end