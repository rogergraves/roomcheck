require 'spec_helper'

describe "check_item_templates/show" do
  before(:each) do
    @check_item_template = assign(:check_item_template, stub_model(CheckItemTemplate,
      :name => "Name",
      :area => "Area",
      :item_order => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Area/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
