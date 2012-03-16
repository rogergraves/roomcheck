require 'spec_helper'
require 'factory_girl_rails'

describe "check_lists/index.html.erb" do
  
  context "viewing checklist items" do
    it 'shows correct number of check items' do
      @checklists = []
      3.times do 
        list = Factory(:check_list)
        list.check_items = [Factory(:check_item)]
        @checklists << list
      end  
      render
      rendered.should have_tag("li", :count => 3)
    end
  end
  
  # it 'has an edit link' do
  #     rendered.should have_link('edit', )
  #   end
end
