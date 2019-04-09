class Purchase < ApplicationRecord
  belongs_to :product
  has_one :refund
end
