require 'spec_helper'

describe "check_lists/new" do
  context "form" do
    before :each do
      assign(:check_list, CheckList.new)
      render
    end
  
    it "has a title" do
      rendered.should have_content("Add a New Checklist")
    end
    
    it "has a form for entering in a new item" do
      rendered.should have_tag("form", :with => { :action => "/check_lists", :method => "post"}) do
        with_tag "input", :with => { :name => "check_list[name]" }
      end
    end
  end
  
  context "errors" do
      before do
        check_list = CheckList.new
        check_list.valid?
        assign(:check_list, check_list)
        render
      end
      
      it "displays errors when saving fails" do
        rendered.should have_content("can't be blank")
      end
    end
end

