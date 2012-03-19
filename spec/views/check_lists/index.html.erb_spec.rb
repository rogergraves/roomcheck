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
  
    it "has an 'add item' button" do
      rendered.should have_link ('Add Item')
    end
  
  # context "when adding a new CheckItem" do
  #    it "increases the number of listed items by one" do
  #      expect {
  #        post :create, Factory(:check_item)
  #      }.to change(have_tag("li", :count => 4))
  #    end
  #  end
   
end
