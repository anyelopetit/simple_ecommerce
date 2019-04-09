class SellersPayment < ApplicationRecord
  belongs_to :payment
  belongs_to :seller
end
