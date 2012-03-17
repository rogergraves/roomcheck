require 'spec_helper'

describe "New Check Item Page" do
  before :each do
    render new_check_item_path
  end
  
  it "has a title" do
    rendered.should contain("Add a New Item to Checklist")
  end
end
