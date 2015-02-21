class CreateProducts < ActiveRecord::Migration
  def change
    #drop_table :products
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :minimum_age_appropriate
      t.integer :maximum_age_appropriate

      t.timestamps null: false
    end
  end
end
