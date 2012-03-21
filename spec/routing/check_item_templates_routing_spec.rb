require "spec_helper"

describe CheckItemTemplatesController do
  describe "routing" do

    it "routes to #index" do
      get("/check_item_templates").should route_to("check_item_templates#index")
    end

    it "routes to #new" do
      get("/check_item_templates/new").should route_to("check_item_templates#new")
    end

    it "routes to #show" do
      get("/check_item_templates/1").should route_to("check_item_templates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/check_item_templates/1/edit").should route_to("check_item_templates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/check_item_templates").should route_to("check_item_templates#create")
    end

    it "routes to #update" do
      put("/check_item_templates/1").should route_to("check_item_templates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/check_item_templates/1").should route_to("check_item_templates#destroy", :id => "1")
    end

  end
end
