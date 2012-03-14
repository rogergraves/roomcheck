class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :severity
      t.string :comment
      t.integer :unit_id
      t.integer :check_item_id

      t.timestamps
    end
  end
end
