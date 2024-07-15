class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.string :phone unless column_exists?(:users, :phone)
    end
  end
end
