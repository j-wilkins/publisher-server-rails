require 'rails_helper'

RSpec.describe SoundsController, type: :controller do

  # # This should return the minimal set of attributes required to create a valid
  # # Sound. As you add validations to Sound, be sure to
  # # adjust the attributes here as well.
  # let(:valid_attributes) {
  #   skip("Add a hash of attributes valid for your model")
  # }
  #
  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }
  #
  # # This should return the minimal set of values that should be in the session
  # # in order to pass any filters (e.g. authentication) defined in
  # # SoundsController. Be sure to keep this updated too.
  # let(:valid_session) { {} }
  #
  # describe "GET #index" do
  #   it "assigns all sounds as @posts" do
  #     post = Sound.create! valid_attributes
  #     get :index, {}, valid_session
  #     expect(assigns(:posts)).to eq([post])
  #   end
  # end
  #
  # describe "GET #show" do
  #   it "assigns the requested sound as @post" do
  #     post = Sound.create! valid_attributes
  #     get :show, {id: post.to_param}, valid_session
  #     expect(assigns(:post)).to eq(post)
  #   end
  # end
  #
  # describe "GET #new" do
  #   it "assigns a new sound as @post" do
  #     get :new, {}, valid_session
  #     expect(assigns(:post)).to be_a_new(Sound)
  #   end
  # end
  #
  # describe "GET #edit" do
  #   it "assigns the requested sound as @post" do
  #     post = Sound.create! valid_attributes
  #     get :edit, {id: post.to_param}, valid_session
  #     expect(assigns(:post)).to eq(post)
  #   end
  # end
  #
  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new Sound" do
  #       expect {
  #         post :create, {sound: valid_attributes}, valid_session
  #       }.to change(Sound, :count).by(1)
  #     end
  #
  #     it "assigns a newly created sound as @post" do
  #       post :create, {sound: valid_attributes}, valid_session
  #       expect(assigns(:post)).to be_a(Sound)
  #       expect(assigns(:post)).to be_persisted
  #     end
  #
  #     it "redirects to the created sound" do
  #       post :create, {sound: valid_attributes}, valid_session
  #       expect(response).to redirect_to(Sound.last)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "assigns a newly created but unsaved sound as @post" do
  #       post :create, {sound: invalid_attributes}, valid_session
  #       expect(assigns(:post)).to be_a_new(Sound)
  #     end
  #
  #     it "re-renders the 'new' template" do
  #       post :create, {sound: invalid_attributes}, valid_session
  #       expect(response).to render_template("new")
  #     end
  #   end
  # end
  #
  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }
  #
  #     it "updates the requested sound" do
  #       post = Sound.create! valid_attributes
  #       put :update, {id: post.to_param, sound: new_attributes}, valid_session
  #       post.reload
  #       skip("Add assertions for updated state")
  #     end
  #
  #     it "assigns the requested sound as @post" do
  #       post = Sound.create! valid_attributes
  #       put :update, {id: post.to_param, sound: valid_attributes}, valid_session
  #       expect(assigns(:post)).to eq(post)
  #     end
  #
  #     it "redirects to the sound" do
  #       post = Sound.create! valid_attributes
  #       put :update, {id: post.to_param, sound: valid_attributes}, valid_session
  #       expect(response).to redirect_to(sound)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "assigns the sound as @post" do
  #       post = Sound.create! valid_attributes
  #       put :update, {id: post.to_param, sound: invalid_attributes}, valid_session
  #       expect(assigns(:post)).to eq(post)
  #     end
  #
  #     it "re-renders the 'edit' template" do
  #       post = Sound.create! valid_attributes
  #       put :update, {id: post.to_param, sound: invalid_attributes}, valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end
  #
  # describe "DELETE #destroy" do
  #   it "destroys the requested sound" do
  #     post = Sound.create! valid_attributes
  #     expect {
  #       delete :destroy, {id: post.to_param}, valid_session
  #     }.to change(Sound, :count).by(-1)
  #   end
  #
  #   it "redirects to the sounds list" do
  #     post = Sound.create! valid_attributes
  #     delete :destroy, {id: post.to_param}, valid_session
  #     expect(response).to redirect_to(sounds_url)
  #   end
  # end

end
