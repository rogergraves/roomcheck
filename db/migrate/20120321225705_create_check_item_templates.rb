class CreateCheckItemTemplates < ActiveRecord::Migration
  def change
    create_table :check_item_templates do |t|
      t.string :name
      t.string :area
      t.integer :item_order

      t.timestamps
    end
  end
end
