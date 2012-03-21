class AddOrderToCheckItems < ActiveRecord::Migration
  def change
    add_column :check_items, :order, :integer

  end
end
