require 'spec_helper'

describe "Add Item link" do
  describe "GET /new_check_item" do
    it "takes you to the 'new check item' page" do
      visit check_lists_path
      click_link "Add Item"
      page.should have_content("CheckItems#new")
    end
  end
end

describe "check_lists/new.html.erb" do
  context "new checklist" do
    it "Creates a checklist" do
      visit new_check_list_path
      fill_in "Unit name", :with => "Unit 1"
      select "Yes", :from => "Add template items?"
      click_button "Save"
      page.should have_content ("Saved")
    end
  end
end