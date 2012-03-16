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
