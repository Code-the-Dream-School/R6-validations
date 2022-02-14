class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :product_name
      t.integer :product_count
      t.integer :customer_id

      t.timestamps
    end
  end
end
