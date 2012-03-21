class RemoveOrderFromCheckItems < ActiveRecord::Migration
  def change
    remove_column :check_items, :order
  end
end
