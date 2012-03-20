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
    
    it 'has all template items on it' do
      checklist = CheckList.new :name => 'Template Checklist', :unit_id => 1
      check_item1 = CheckItem.create :name => "check false"
      check_item2 = CheckItem.create :name => "check true", :template_item => "true"
      template_items = []
      CheckItem.all.each do |check_item|
        if check_item.template_item == true
          template_items << check_item
        end
      end
      checklist.check_items.length.should eq template_items.length
    end
end
