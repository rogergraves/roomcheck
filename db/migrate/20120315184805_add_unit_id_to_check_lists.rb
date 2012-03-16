class AddUnitIdToCheckLists < ActiveRecord::Migration
  def change
    add_column :check_lists, :unit_id, :integer

  end
end
