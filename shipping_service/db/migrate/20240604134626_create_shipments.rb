class CreateShipments < ActiveRecord::Migration[7.1]
  def change
    create_table :shipments do |t|
      t.integer :order_id
      t.string :address
      t.string :status

      t.timestamps
    end
  end
end
