 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/game_entries", type: :request do
  # GameEntry. As you add validations to GameEntry, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
        name: 'Bla'
    }
  }

  let(:invalid_attributes) {
    {
        name: nil
    }
  }
  let(:test_user){ FactoryBot.create(:user) }

  before :each do
    sign_in(test_user)
  end

  describe "GET /index" do
    it "renders a successful response" do
      GameEntry.create! valid_attributes
      get game_entries_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      game_entry = GameEntry.create! valid_attributes
      get game_entry_url(game_entry)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_game_entry_url
      puts response.body
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      game_entry = GameEntry.create! valid_attributes
      get edit_game_entry_url(game_entry)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new GameEntry" do
        expect {
          post game_entries_url, params: { game_entry: valid_attributes }
        }.to change(GameEntry, :count).by(1)
      end

      it "redirects to the overview" do
        post game_entries_url, params: { game_entry: valid_attributes }
        expect(response).to redirect_to(game_entries_path)
      end
    end

    context "with invalid parameters" do
      it "does not create a new GameEntry" do
        expect {
          post game_entries_url, params: { game_entry: invalid_attributes }
        }.to change(GameEntry, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post game_entries_url, params: { game_entry: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: 'NewName'}
      }

      it "updates the requested game_entry" do
        game_entry = GameEntry.create! valid_attributes
        patch game_entry_url(game_entry), params: { game_entry: new_attributes }
        game_entry.reload
        expect(game_entry.name).to eq 'NewName'
      end

      it "redirects to the overview" do
        game_entry = GameEntry.create! valid_attributes
        patch game_entry_url(game_entry), params: { game_entry: new_attributes }
        game_entry.reload
        expect(response).to redirect_to(game_entries_path)
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        game_entry = GameEntry.create! valid_attributes
        patch game_entry_url(game_entry), params: { game_entry: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested game_entry" do
      game_entry = GameEntry.create! valid_attributes
      expect {
        delete game_entry_url(game_entry)
      }.to change(GameEntry, :count).by(-1)
    end

    it "redirects to the game_entries list" do
      game_entry = GameEntry.create! valid_attributes
      delete game_entry_url(game_entry)
      expect(response).to redirect_to(game_entries_url)
    end
  end
end
