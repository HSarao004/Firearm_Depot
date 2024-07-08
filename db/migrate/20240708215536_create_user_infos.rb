class CreateUserInfos < ActiveRecord::Migration[7.1]
  def change
    create_table :user_infos do |t|
      t.references :user, null: false, foreign_key: true
      t.string :street
      t.string :city
      t.string :province
      t.string :postal_code
      t.string :card_number
      t.string :expiry
      t.string :cvv

      t.timestamps
    end
  end
end
