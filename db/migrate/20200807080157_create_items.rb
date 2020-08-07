class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.string :comment, null: false
      t.string :category_id, null: false
      t.string :status_id, null: false
      t.string :delivery_fee_id, null: false
      t.string :shipping_origin_id, null: false
      t.string :shipping_date_id, null: false
      t.string :price, null: false
      t.string :users, null: false
      t.timestamps
    end
  end
end
