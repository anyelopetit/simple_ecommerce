class CreateRefunds < ActiveRecord::Migration[5.2]
  def change
    create_table :refunds do |t|
      t.float :purchase_price
      t.datetime :refunded_at

      t.references :purchase, foreign_key: true, index: true

      t.timestamps
    end
  end
end
