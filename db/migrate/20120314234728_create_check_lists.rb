class CreateCheckLists < ActiveRecord::Migration
  def change
    create_table :check_lists do |t|
      t.string :name
      t.integer :check_item_id

      t.timestamps
    end
  end
end
