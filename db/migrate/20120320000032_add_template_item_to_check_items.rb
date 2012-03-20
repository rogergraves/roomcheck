class AddTemplateItemToCheckItems < ActiveRecord::Migration
  def change
    add_column :check_items, :template_item, :boolean, :default => false, :null => false

  end
end
