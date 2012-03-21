require 'spec_helper'

describe CheckList do
  context "model fields" do
    it 'requires a name' do
      checklist = CheckList.new
      checklist.valid?
      should_not be_valid
      checklist.errors[:name].should_not be_empty
    end 
  end
  
    context "when new checklist is created with template items set to true" do
      it 'has all template items on it' do
        check_item1 = CheckItem.create :name => "check false"
        check_item2 = CheckItem.create :name => "check true", :template_item => "true"
        
        checklist = CheckList.create :name => 'Template Checklist'
        checklist.add_template_items=true
        checklist.check_items.length.should eq 1
      end
    end
end
