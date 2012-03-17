require 'spec_helper'

describe "check_items/new.html.erb" do
  before :each do
    render
  end
  
  it "has a title" do
    rendered.should contain("Add a New Item to Checklist")
  end
end
