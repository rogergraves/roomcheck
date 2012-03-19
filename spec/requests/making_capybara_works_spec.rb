require 'spec_helper'

describe "MakingCapybaraWorks" do
  before :each do
    @checklists = []
    3.times do 
      list = Factory(:check_list)
      list.check_items = [Factory(:check_item)]
      @checklists << list
    end
  end
  
  describe "GET /making_capybara_works" do
    it "works! (now write some real specs)" do
      visit check_lists_path
      click_link "Edit"
      page.should have_content("CheckItems#edit")
    end
  end
end


describe "Checking edit button works" do
  describe "GET /check report problem page" do
    it "clicks on Report Problem link" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get check_lists_path
      response.status.should be(200)
      click_link "Report Problem"
    end
  end
end
