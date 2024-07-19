class AddCartableToCarts < ActiveRecord::Migration[6.1]
  def change
    add_reference :carts, :cartable, polymorphic: true, null: false
  end
end
