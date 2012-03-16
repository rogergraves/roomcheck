require 'spec_helper'

describe ResultsController do
  
  it '#new: http success' do
    get(:new)
     response.should be_success
  end

  it '#create: adds a new result' do
    @valid_result = {
      :unit_id => 3,
      :check_item_id => 1
    }

    post(:create, { :result => @valid_result})
    assigns(:result).should be_new_record
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
