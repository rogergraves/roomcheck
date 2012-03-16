class AddCheckListIdToCheckItems < ActiveRecord::Migration
  def change
    add_column :check_items, :check_list_id, :integer

  end
end
