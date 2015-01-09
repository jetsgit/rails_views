class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.references :publisher
      t.integer :rating
      t.boolean :discontinued, default: false, null: false

      t.timestamps
    end
  end
end
