require 'spec_helper'

describe CheckItemsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit'
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy'
      response.should be_success
    end
  end
  
  describe '#create: adds a new check_item' do
    context "successful save" do
      let(:valid_item) do
        {:check_item => {
        :check_list_id => 1,
        :name => "name",
        :area => "kitchen"
      }}
      end

      it "redirect to index" do
        post :create, valid_item
        response.should redirect_to(root_path)
      end
      
      it "flashes a 'Saved' message" do
        post :create, valid_item
        flash[:notice].should == 'Item Saved'
      end
    end
  end
end
