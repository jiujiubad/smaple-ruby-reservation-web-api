require 'rails_helper'

RSpec.describe "API_V1::Auth", :type => :request do

  before do
    @user = User.create!( :email => "test@example.com", :password => "12345678")
  end

  example "register" do
    post "/api/v1/signup", params: { :email => "test2@example.com", :password => "12345678"}

    expect(response).to have_http_status(200)

    new_user = User.last
    expect(new_user.email).to eq("test2@example.com")

    expect(response.body).to eq( { :user_id => new_user.id }.to_json )
  end

  example "valid login and logout" do

    post "/api/v1/login", params: { :auth_token => @user.authentication_token, :email => @user.email, :password => "12345678" }

    expect(response).to have_http_status(200)

    user = User.last

    expect(response.body).to eq(
      {
        :message => "Ok",
        :auth_token => user.authentication_token,
        :user_id => user.id
      }.to_json
    )


    post "/api/v1/logout"
    expect(response).to have_http_status(401)


    post "/api/v1/logout", params: { :auth_token => user.authentication_token }
    expect(response).to have_http_status(200)
    expect(User.last.authentication_token).not_to eq(user.authentication_token)
  end

  example "invalid auth token login" do

    post "/api/v1/login", params: { :auth_token => @user.authentication_token, :email => @user.email, :password => "xxx" }

    expect(response).to have_http_status(401)
    expect(response.body).to eq(
      { :message => "Email or Password is wrong" }.to_json
    )
  end

end
