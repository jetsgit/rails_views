class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.references :product_id
      t.references :category_id, index: true

      t.timestamps
    end
  end
end
