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
      rendered.should have_selector("form", :with => { :action => "new_check_item_path", :method => "post"}) do |form|
        form.should
        have_selector('label', :for => 'name', :content => 'name')
      end
    end
  end
end
