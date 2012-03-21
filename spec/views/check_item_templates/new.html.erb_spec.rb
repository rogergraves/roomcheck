require 'spec_helper'

describe "check_item_templates/new" do
  before(:each) do
    assign(:check_item_template, stub_model(CheckItemTemplate,
      :name => "MyString",
      :area => "MyString",
      :item_order => 1
    ).as_new_record)
  end

  it "renders new check_item_template form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => check_item_templates_path, :method => "post" do
      assert_select "input#check_item_template_name", :name => "check_item_template[name]"
      assert_select "input#check_item_template_area", :name => "check_item_template[area]"
      assert_select "input#check_item_template_item_order", :name => "check_item_template[item_order]"
    end
  end
end
