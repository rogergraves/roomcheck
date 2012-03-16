require 'spec_helper'

describe ResultsController do
  
  it '#new: http success' do
    get(:new)
     response.should be_success
  end

  it '#create: adds a new result' do
    result = Result.new :unit_id => 3, :check_item_id => 1
    result.should be_valid
  end

  it '#create: doesnt add a new result without unit_id' do
    result = Result.new :check_item_id => 1
    result.should_not be_valid
  end

  it '#create: doesnt add a new result without check_item_id' do
    result = Result.new :unit_id => 3
    result.should_not be_valid
  end


  # create_table "results", :force => true do |t|
  #   t.integer  "severity"
  #   t.string   "comment"
  #   t.integer  "unit_id"
  #   t.integer  "check_item_id"
  #   t.datetime "created_at",    :null => false
  #   t.datetime "updated_at",    :null => false
  # end


  # describe "GET 'new'" do
  #   it "returns http success" do
  #     get 'new'
  #     response.should be_success
  #   end
  # end
  # 
  # describe "GET 'create'" do
  #   it "returns http success" do
  #     get 'create'
  #     response.should be_success
  #   end
  # end
  # 
  # describe "GET 'edit'" do
  #   it "returns http success" do
  #     get 'edit'
  #     response.should be_success
  #   end
  # end
  # 
  # describe "GET 'update'" do
  #   it "returns http success" do
  #     get 'update'
  #     response.should be_success
  #   end
  # end
  # 
  # describe "GET 'destroy'" do
  #   it "returns http success" do
  #     get 'destroy'
  #     response.should be_success
  #   end
  # end
  # 
  # describe "GET 'show'" do
  #   it "returns http success" do
  #     get 'show'
  #     response.should be_success
  #   end
  # end

end
