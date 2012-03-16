class RemoveCheckItemIdFromCheckLists < ActiveRecord::Migration
  def up
    remove_column :check_lists, :check_item_id
      end

  def down
    add_column :check_lists, :check_item_id, :integer
  end
end
