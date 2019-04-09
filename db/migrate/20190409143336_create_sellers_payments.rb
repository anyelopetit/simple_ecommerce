class CreateSellersPayments < ActiveRecord::Migration[5.2]
  def change
    create_table :sellers_payments do |t|
      t.references :payment, foreign_key: true
      t.references :seller, foreign_key: true
      t.float :paid_out

      t.timestamps
    end
  end
end
