require 'spec_helper'

describe "result/new.html.erb" do
  context "Result" do
    it "Create a new result" do
      visit new_result_path
      fill_in "Describe problem", :with => "The sink is exploding"
      select "Severity", :with => "Emergency"
      click_button "Save"
      page.should have_content ("Saved")
    end
  end
end