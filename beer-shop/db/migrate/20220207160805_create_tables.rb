class CreateTables < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :content
      t.string :image

      t.timestamps
    end

    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :birthday
      
      t.timestamps
    end

    create_table :categories do |t|
      t.string :name
      
      t.timestamps
    end

    add_reference :products, :category

    
  end
end
