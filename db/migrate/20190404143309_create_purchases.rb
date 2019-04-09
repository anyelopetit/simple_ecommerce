class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.float :product_price
      t.datetime :purchased_at

      t.references :product, foreign_key: true, index: true

      t.timestamps
    end
  end
end
