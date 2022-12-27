class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :shipping_postal_code
      t.string :shipping_address
      t.string :name
      t.integer :postage
      t.integer :billing_amount
      t.integer :method_of_payment
      t.integer :is_ordered
      t.timestamps
    end
  end
end
