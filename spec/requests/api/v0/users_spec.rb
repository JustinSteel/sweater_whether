require 'rails_helper'

describe "Users API", type: :request do
  describe 'POST #create' do
    let(:valid_params) do
    {
      email: 'randy@randy.com',
      password: 'password',
      password_confirmation: 'password'
    }
    end
    let(:invalid_params) do
      {
      email: 'randy@randy.com',
      password: 'password',
      password_confirmation: 'password1'
    }
  end

    describe 'happy path' do
      it 'creates a new user' do
        post '/api/v0/users', params: valid_params
        expect(response).to be_successful
        expect(response.status).to eq(201)
        expect(JSON.parse(response.body, symbolize_names: true)).to eq(UserSerializer.format_user(User.last))
      end
    end

    describe 'sad path' do
      it 'returns an error if passwords do not match' do
        post '/api/v0/users', params: invalid_params
        expect(response).to_not be_successful
        expect(response.status).to eq(422)
        expect(JSON.parse(response.body, symbolize_names: true)).to eq(ErrorSerializer.format_errors("Password confirmation doesn't match Password"))
      end
    end
  end
end
