class CreateOrdersAndOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :status, default: 0
      t.string :name
      t.string :phone
      t.text :info
      t.text :address

      t.timestamps
    end
    
    create_table :order_items do |t|
      t.integer :quantity, default: 1

      t.timestamps
    end

    add_reference :order_items, :order
    add_reference :order_items, :product
  end
end
