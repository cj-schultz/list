require 'spec_helper'

describe UsersController do
  before do
    @user = User.create!(user_attributes)
  end

  context "when not signed in" do

    before do
      session[:user_id] = nil
    end

    it "cannot access edit" do
      get :edit, id: @user

      expect(response).to redirect_to(welcome_url)
    end

    it "cannot access update" do
      patch :update, id: @user

      expect(response).to redirect_to(welcome_url)
    end

    it "cannot access destroy" do
      delete :destroy, id: @user

      expect(response).to redirect_to(welcome_url)
    end

  end

  context "when a wrong user is signed in" do
    before do
      @wrong_user = User.create!(user_attributes(email: "wrong@example.com"))
      session[:user_id] = @wrong_user
    end

    it "cannot edit another user" do
      get :edit, id: @user

      expect(response).to redirect_to(root_url)
    end

    it "cannot delete another user" do
      delete :destroy, id: @user

      expect(response).to redirect_to(root_url)
    end

    it "cannot update another user" do
      patch :update, id: @user

      expect(response).to redirect_to(root_url)
    end
  end
end
