class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :customer_name
      t.integer :product_id
      t.integer :quantity

      t.timestamps
    end
  end
end
