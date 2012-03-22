require 'spec_helper'

describe "check_item_templates/index" do
  before(:each) do
    assign(:check_item_templates, [
      stub_model(CheckItemTemplate,
        :name => "Name",
        :area => "Area",
        :item_order => 1
      ),
      stub_model(CheckItemTemplate,
        :name => "Name",
        :area => "Area",
        :item_order => 1
      )
    ])
  end

  it "renders a list of check_item_templates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Area".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
