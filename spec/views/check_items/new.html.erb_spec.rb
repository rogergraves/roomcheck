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
  end
end
