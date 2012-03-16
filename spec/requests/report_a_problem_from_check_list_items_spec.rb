require 'spec_helper'

describe "ReportAProblemFromCheckListItems" do
  describe "GET /report_a_problem_from_check_list_items" do
    it "Saves a new reported problem OK" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      list = FactoryGirl.create(:check_list)
      list_item = FactoryGirl.create(:check_list_item)
      list << list_item
      get check_lists_path
      click_link "Report Problem"
      # fill_in ""
      click_link "Save"
      list.problems.should not_be_empty
      list
      
      response.status.should be(200)
    end
  end
end
