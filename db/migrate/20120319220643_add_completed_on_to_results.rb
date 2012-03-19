class AddCompletedOnToResults < ActiveRecord::Migration
  def change
    add_column :results, :completed_on, :datetime

  end
end
