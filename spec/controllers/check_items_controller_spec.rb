require 'spec_helper'

describe CheckItemsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
   it "should be able to rename the check_item" do
     #make a check_item with the old name - CheckItem.create(:)
     check_item = CheckItem.create(:name => 'old_name')
     #post to /check_items/#{check_item.id} or check_items_edit_path(check_item), and attributes hash
     put :update, :id => check_item.id, :check_item => { :name => 'blah'}
     #check_item.reload and compare names
     check_item.reload.name.should == 'blah'
   end
  end
   
  describe "GET 'destroy'" do
    it "should destroy an existing check_item" do
      check_item = CheckItem.create(:name => 'old_name')
      delete :destroy, :id => check_item.id
      response.should redirect_to(check_lists_path)
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
        response.should redirect_to(check_lists_path)
      end
      
      it "adds a new check item" do
        expect {
          post :create, valid_item
        }.to change(CheckItem, :count).by(1)
      end
              
      it "flashes a 'Saved' message" do
        post :create, valid_item
        flash[:notice].should == 'Item Saved'
      end
    end
  end
end

