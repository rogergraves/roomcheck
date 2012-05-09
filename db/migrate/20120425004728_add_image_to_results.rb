class AddImageToResults < ActiveRecord::Migration
  def change
    add_column :results, :image, :string

  end
end
