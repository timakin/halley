require "spec_helper"

describe DataboxesController do
  describe "routing" do

    it "routes to #index" do
      get("/databoxes").should route_to("databoxes#index")
    end

    it "routes to #new" do
      get("/databoxes/new").should route_to("databoxes#new")
    end

    it "routes to #show" do
      get("/databoxes/1").should route_to("databoxes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/databoxes/1/edit").should route_to("databoxes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/databoxes").should route_to("databoxes#create")
    end

    it "routes to #update" do
      put("/databoxes/1").should route_to("databoxes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/databoxes/1").should route_to("databoxes#destroy", :id => "1")
    end

  end
end
