class CreateCheckItems < ActiveRecord::Migration
  def change
    create_table :check_items do |t|
      t.string :name
      t.string :area

      t.timestamps
    end
  end
end
