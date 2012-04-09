require 'spec_helper'

describe CheckList do
  context "create" do
    it 'requires a name' do
      checklist = CheckList.new
      checklist.valid?
      checklist.errors[:name].should_not be_empty
    end 
  
    it "name must be unique" do
      checklist1 = CheckList.create(name: 'something')
      checklist2 = CheckList.create(name: 'something')
      checklist2.errors[:name].should_not be_empty
    end
  end
end
