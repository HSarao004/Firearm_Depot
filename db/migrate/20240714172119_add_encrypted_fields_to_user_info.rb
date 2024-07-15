class AddEncryptedFieldsToUserInfo < ActiveRecord::Migration[7.1]
  def change
    add_column :user_infos, :encrypted_card_number, :string
    add_column :user_infos, :encrypted_expiry, :string
    add_column :user_infos, :encrypted_cvv, :string
  end
end
