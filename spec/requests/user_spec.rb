require 'rails_helper'


RSpec.describe "Users", type: :request do
  let!(:user1) {create(:user, username:"User1", email: "ama@gmail.com", password:"123123123")}
  
  let(:params) {{ user: {
    username:"User25", email: "amafafadfaa@gmail.com", password:"123123123"
    }
  }}

  let(:params_invalid) {{ user: {
    username:"User25", email: "amafafadfaagmail.com", password:"123123123"
    }
  }}
  describe "GET /index" do
    it 'assigns @users' do
      #user = User.create 
      get :"/api/v1/users"
      expect(response).to have_http_status(:ok)
      puts response.body
      expect(JSON.parse(response.body)[0]["id"]).to eq(user1.id)
      expect(JSON.parse(response.body)[0]["username"]).to eq(user1.username)
      expect(JSON.parse(response.body)[0]["email"]).to eq(user1.email)
    end
  end

  describe "Post /create" do
    context 'with valid parameters' do
        it 'creates new user' do
          post :"/api/v1/users", params: params
          expect(response).to have_http_status(:ok)
          puts response.body
          

        end
      end
    end

  describe "get show" do
    context 'with valid parameters' do
        it 'a user' do
          get :"/api/v1/users/#{user1.id}"
          expect(response).to have_http_status(:ok)
          puts response.body
          expect(JSON.parse(response.body)["email"]).to eq(user1.email)
          expect(JSON.parse(response.body)["id"]).to eq(user1.id)
          expect(JSON.parse(response.body)["username"]).to eq(user1.username)
        end
      end
    end

  describe "Put update" do
    context 'with valid parameters' do
        it 'updates user1 to user25' do
          put :"/api/v1/users/#{user1.id}", params: params
          expect(response).to have_http_status(:ok)
          puts response.body
          expect(JSON.parse(response.body))
        end
      end
    end
end




