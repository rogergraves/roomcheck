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
