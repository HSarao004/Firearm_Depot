class AddForeignKeyToOrders < ActiveRecord::Migration[6.1]
  def change
    unless foreign_key_exists?(:orders, :taxes)
      add_foreign_key :orders, :taxes, on_delete: :restrict
    end
  end

  private

  def foreign_key_exists?(from_table, to_table, column = nil)
    foreign_keys(from_table).any? do |fk|
      fk.to_table == to_table.to_s && (column.nil? || fk.column == column.to_s)
    end
  end
end
