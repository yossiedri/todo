require "spec_helper"

describe TodotasksController do
  describe "routing" do

    it "routes to #index" do
      get("/todotasks").should route_to("todotasks#index")
    end

    it "routes to #new" do
      get("/todotasks/new").should route_to("todotasks#new")
    end

    it "routes to #show" do
      get("/todotasks/1").should route_to("todotasks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/todotasks/1/edit").should route_to("todotasks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/todotasks").should route_to("todotasks#create")
    end

    it "routes to #update" do
      put("/todotasks/1").should route_to("todotasks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/todotasks/1").should route_to("todotasks#destroy", :id => "1")
    end

  end
end
