class RemoveTemplateItemFromCheckItems < ActiveRecord::Migration
  def change
    remove_column :check_items, :template_item
  end
end
