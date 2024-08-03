class AddTaxReferenceToOrders < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:orders, :tax_id)
      add_reference :orders, :tax, null: false, foreign_key: true
    end
  end
end
