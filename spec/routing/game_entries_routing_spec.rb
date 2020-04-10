require "rails_helper"

RSpec.describe GameEntriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/game_entries").to route_to("game_entries#index")
    end

    it "routes to #new" do
      expect(get: "/game_entries/new").to route_to("game_entries#new")
    end

    it "routes to #show" do
      expect(get: "/game_entries/1").to route_to("game_entries#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/game_entries/1/edit").to route_to("game_entries#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/game_entries").to route_to("game_entries#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/game_entries/1").to route_to("game_entries#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/game_entries/1").to route_to("game_entries#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/game_entries/1").to route_to("game_entries#destroy", id: "1")
    end
  end
end
