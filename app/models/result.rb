class Result < ActiveRecord::Base
  validates :severity, :presence => true
  validates_inclusion_of :severity, :in => 0..5
  
  belongs_to :unit
  

end


# create_table "results", :force => true do |t|
#   t.integer  "severity"
#   t.string   "comment"
#   t.integer  "unit_id"
#   t.integer  "check_item_id"
#   t.datetime "created_at",    :null => false
#   t.datetime "updated_at",    :null => false
# end