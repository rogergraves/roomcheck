require 'spec_helper'

describe CheckList do
  context "model fields" do
    it 'requires a name' do
      checklist = CheckList.new :unit_id => 1
      checklist.valid?
      should_not be_valid
      checklist.errors[:name].should_not be_empty
    end
    
    it 'requires a unit_id' do
      checklist = CheckList.new :name => 'Some checklist'
      checklist.valid?
      should_not be_valid
      checklist.errors[:unit_id].should_not be_empty
    end
  end
end
