class UpdateTaxesTable < ActiveRecord::Migration[6.1]
  def change
    change_table :taxes do |t|
      t.remove :tax_rate
      t.decimal :gst_rate, precision: 5, scale: 2, default: 0.00, null: false
      t.decimal :pst_rate, precision: 5, scale: 2, default: 0.00, null: false
      t.decimal :hst_rate, precision: 5, scale: 2, default: 0.00, null: false
    end
  end
end
