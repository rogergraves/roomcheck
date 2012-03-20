class RemoveUnitIdFromResultsAndCheckLists < ActiveRecord::Migration
  def change
    remove_column :check_lists, :unit_id
    remove_column :results, :unit_id
  end
end
