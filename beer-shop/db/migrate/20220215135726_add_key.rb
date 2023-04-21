class AddKey < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :user
    add_reference :products, :order
  end
end
