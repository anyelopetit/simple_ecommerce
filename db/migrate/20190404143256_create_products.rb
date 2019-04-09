class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.references :seller, foreign_key: true, index: true

      t.timestamps
    end
  end
end
