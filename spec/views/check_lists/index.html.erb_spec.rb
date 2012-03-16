require 'spec_helper'
require 'factory_girl_rails'

describe "check_lists/index.html.erb" do
  before do
    @list_item = Factory(:check_item)
    @checklists = Factory(:check_list)
    @list_item.check_list_id = @checklists.id
    puts @list_item.check_list_id
    puts @checklists.check_items.all
    #assign :check_items, @list_item
    assign :checklists, [@checklists]
    render   
  end
  
  context "viewing checklist items" do
    it 'shows correct number of check items' do
      rendered.should have_tag("li", :count => 1)
    end
  end
end
