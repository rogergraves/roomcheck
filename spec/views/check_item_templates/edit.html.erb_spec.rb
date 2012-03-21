require 'spec_helper'

describe "check_item_templates/edit" do
  before(:each) do
    @check_item_template = assign(:check_item_template, stub_model(CheckItemTemplate,
      :name => "MyString",
      :area => "MyString",
      :item_order => 1
    ))
  end

  it "renders the edit check_item_template form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => check_item_templates_path(@check_item_template), :method => "post" do
      assert_select "input#check_item_template_name", :name => "check_item_template[name]"
      assert_select "input#check_item_template_area", :name => "check_item_template[area]"
      assert_select "input#check_item_template_item_order", :name => "check_item_template[item_order]"
    end
  end
end
