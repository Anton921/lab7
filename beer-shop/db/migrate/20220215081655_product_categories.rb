class ProductCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :product_categories do |t|
      t.string :name

      t.timestamps
    end
    
    add_reference :products, :product_category
    add_reference :product_categories, :category
  end
end
