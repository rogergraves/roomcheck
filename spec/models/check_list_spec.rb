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
    # context "when new checklist is created with template items"
    #   it 'has all template items on it' do
    #     check_item1 = CheckItem.create :name => "check false"
    #     check_item2 = CheckItem.create :name => "check true", :template_item => "true"
    #     checklist = CheckList.create :name => 'Template Checklist', :unit_id => 1
    #     template_items = []
    #     CheckItem.all.each do |check_item|
    #       if check_item.template_item == true
    #         template_items << check_item
    #       end
    #     end
    #     checklist.check_items.length.should eq template_items.length
    #   end
    # end
end
