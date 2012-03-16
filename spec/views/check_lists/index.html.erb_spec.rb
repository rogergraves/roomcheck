require 'spec_helper'

describe "check_lists/index.html.erb", :type => :request do
  before :each do
    @checklists = []
    3.times do 
      list = Factory(:check_list)
      list.check_items = [Factory(:check_item)]
      @checklists << list
    end  
    render
  end
  
  context "viewing checklist items" do
    it "has correct number of check items" do
      rendered.should have_tag("li", :count => 3)
    end
  end
  
end
