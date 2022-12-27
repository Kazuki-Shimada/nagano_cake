class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :items_id
      t.integer :is_created
      t.integer :price
      t.integer :amount
      t.timestamps
    end
  end
end
