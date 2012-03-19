require 'spec_helper'

describe "check_items/new" do
  context "form" do
    before :each do
      assign(:check_item, CheckItem.new)
      render
    end
  
    it "has a title" do
      rendered.should have_content("Add a New Item to Checklist")
    end
    
    it "has a form for entering in a new item" do
      rendered.should have_tag("form", :with => { :action => "/check_items", :method => "post"}) do
        with_tag "input", :with => { :name => "check_item[area]" }
      end
    end
  end
  
  context "errors" do
      before do
        check_item = CheckItem.new
        check_item.valid?
        assign(:check_item, check_item)
        render
      end
      
      it "displays errors when link saving fails" do
        rendered.should have_content("can't be blank")
      end
    end
end
