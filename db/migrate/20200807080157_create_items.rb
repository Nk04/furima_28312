class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :comment, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :delivery_fee_id, null: false
      t.integer :shipping_origin_id, null: false
      t.integer :shipping_date_id, null: false
      t.string :price, null: false
      t.timestamps
    end
  end
end
