require 'spec_helper'

describe Result do
  it 'requires a severity' do
    result = Result.create
    result.severity.should == 0
  end

  it 'severity should be between 0-5' do
    result_fail = Result.new :severity => 6, :comment => "Some comment", :unit_id => 1, :check_item_id => 1
    result_fail.should_not be_valid

    result_pass = Result.new :severity => 3, :comment => "Some comment", :unit_id => 1, :check_item_id => 1
    puts result_pass.inspect
    result_pass.should be_valid
        
  end

  context 'when a comment exists' do
    it "should have a severity greater than 0" do
      result = Result.new :comment => "Something", :unit_id => 1, :check_item_id => 1
      result.valid?
      result.severity.should == 1
    end
  end
  
  context 'when an existing result exists' do
    before :each do
      @result = Result.new :comment => "Something", :unit_id => 1, :check_item_id => 1
      @result.save
    end
    
    it 'comment is editable' do
      @result.comment = "New comment"
      @result.save
      @result.comment.should eq "New comment"
    end

    it 'severity is editable' do
      @result.severity = 5
      @result.save
      @result.severity.should == 5
    end
    
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