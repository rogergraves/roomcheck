require 'spec_helper'

describe "ReportAProblemFromCheckListItems" do
  describe "GET /report_a_problem_from_check_list_items" do
    it "Saves a new reported problem OK with hidden values" do
      @checklists = []
      list = Factory(:check_list)
      3.times do 
        list.check_items << Factory(:check_item)
      end
      visit check_lists_path
      #save_and_open_page
      click_link "Report Problem"
      fill_in "Describe problem", :with => "Exploding toilet"
      click_button "Save"
      page.should_not have_content("Errors occurred")
    end
  end
end
