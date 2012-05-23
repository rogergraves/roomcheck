require 'spec_helper'

describe CheckItemTemplatesController do

  describe "#reverseclone" do
    it "should reverse clone check items from a check item list" do
      @user = Factory(:user)
      sign_in @user
       
      check_list = CheckList.new(name: "Room 555")
      check_list.save
      CheckItem.create!(name: "Sink", area: "Kitchen", check_list_id: check_list.id)
      CheckItem.create!(name: "Bed", area: "Main Room", check_list_id: check_list.id)

      put :reverseclone, {clone_check_list_id: check_list.id}
      
         
    end
  end

end
