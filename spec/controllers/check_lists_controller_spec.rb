require 'spec_helper'

describe CheckListsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

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
  
  describe '#create: adds a new check_list' do
    context "successful save" do
      let(:valid_item) do
        {:check_list => {
        :name => "Unit 102",
      }}
      end

      it "redirect to index" do
        post :create, valid_item
        response.should redirect_to(check_list_path(assigns[:check_list]))
      end

      it "adds a new check item" do
        expect {
          post :create, valid_item
        }.to change(CheckList, :count).by(1)
      end

      it "flashes a 'Saved' message" do
        post :create, valid_item
        flash[:notice].should == 'List Saved'
      end
    end
  end
  
  describe '#delete: deletes check_list' do
    before(:each) do
      @check_list = CheckList.new(name: "Test Checklist")
      @check_list.save
      @check_item = CheckItem.new(name: "Test CheckItem", area: "Test Area", check_list_id: @check_list.id, item_order: 1)
      @check_item.save
      @result = Result.new(severity: 1, comment: "Some comment", check_item_id: @check_item.id)
      @result.save
    end
    
    it "destroying checklist deletes it" do
      @check_list.destroy
      @check_list.destroyed?.should eq true
    end
    
    it "destroying checklist destroys dependent checkitems" do
    end
    
    it "destroying checklist destroys dependent results" do
    end
    
  end

end
