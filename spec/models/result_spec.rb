require 'spec_helper'

describe Result do
  it 'requires a severity' do
    should_not be_valid
    subject.errors[:severity].should_not be_empty
  end
  
  it 'severity should be between 0-5' do
    l_fail = Result.new :severity => 6
    l_fail.should_not be_valid

    l_pass = Result.new :severity => 3
    l_pass.should be_valid
        
  end
end


# create_table "results", :force => true do |t|
#   t.integer  "severity"
#   t.string   "comment"
#   t.integer  "unit_id"
#   t.integer  "check_item_id"
#   t.datetime "created_at",    :null => false
#   t.datetime "updated_at",    :null => false
# end