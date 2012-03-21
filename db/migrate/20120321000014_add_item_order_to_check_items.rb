class AddItemOrderToCheckItems < ActiveRecord::Migration
  def change
    add_column :check_items, :item_order, :integer
  end
end
