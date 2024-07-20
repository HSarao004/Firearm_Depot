class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :total_price, precision: 10, scale: 2
      t.decimal :gst, precision: 5, scale: 2
      t.decimal :pst, precision: 5, scale: 2
      t.decimal :hst, precision: 5, scale: 2
      t.decimal :total_with_tax, precision: 10, scale: 2

      t.timestamps
    end
  end
end
