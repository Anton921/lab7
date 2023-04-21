class DeleteKey < ActiveRecord::Migration[7.0]
  def change
    remove_reference :products, :order
  end
end
