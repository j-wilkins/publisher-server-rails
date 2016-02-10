require "rails_helper"

RSpec.describe PhotosController, type: :routing do
  describe "routing" do

    def photo_params
      { year: "2013", month: "11", day: "02", slug: "farmhouse-conf-5-collapse" }
    end

    def photo_path
      "/photos/2013/11/02/farmhouse-conf-5-collapse"
    end

    it "routes to #index" do
      expect(:get => "/photos").to route_to("photos#index")
    end

    it "routes to #new" do
      expect(:get => "/photos/new").to route_to("photos#new")
    end

    it "routes to #show" do
      expect(:get => photo_path).to route_to("photos#show", photo_params)
    end

    it "routes to #edit" do
      expect(:get => "#{photo_path}/edit").to route_to("photos#edit", photo_params)
    end

    it "routes to #create" do
      expect(:post => "/photos").to route_to("photos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => photo_path).to route_to("photos#update", photo_params)
    end

    it "routes to #update via PATCH" do
      expect(:patch => photo_path).to route_to("photos#update", photo_params)
    end

    it "routes to #destroy" do
      expect(:delete => photo_path).to route_to("photos#destroy", photo_params)
    end

  end
end
