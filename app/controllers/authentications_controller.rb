class AuthenticationsController < ApplicationController
  def fetch
    client_id = ENV['MONZO_CLIENT_ID']
    state_token = ENV['STATE_TOKEN'] # (0...8).map { (65 + rand(26)).chr }.join
    redirect_uri = 'http://localhost:3000/monzo/callback'

    url = "https://auth.monzo.com/?redirect_uri=#{redirect_uri}&client_id=#{client_id}&&response_type=code&state=#{state_token}"

    redirect_to url
  end

  def callback
    url = "https://api.monzo.com/oauth2/token"
    redirect_uri = 'http://localhost:3000/monzo/callback'

    body = {
      "grant_type"=> "authorization_code",
      "client_id"=> ENV['MONZO_CLIENT_ID'],
      "client_secret"=> ENV['MONZO_CLIENT_SECRET'],
      "redirect_uri"=> redirect_uri,
      "code"=> params[:code]
    }

    response = Faraday.post(url, body)
    json_response = JSON.parse(response.body)

    update_user(json_response['access_token'], json_response['refresh_token'])

    flash[:notice] = 'You have successfully linked your Monzo account'
    redirect_to transactions_path
  end

  def index
    @user = current_user
    url = "https://api.monzo.com/accounts"

    body = {"Authorization" => @user.monzo_access_token}

    response = Faraday.get(url, body)
    json_response = JSON.parse(response.body)
    binding.pry
  end

  def refresh

    url = "https://api.monzo.com/oauth2/token"

    body = {
      "grant_type"=> "refresh_token",
      "client_id"=> ENV['MONZO_CLIENT_ID'],
      "client_secret"=> ENV['MONZO_CLIENT_SECRET'],
      "refresh_token"=> current_user.monzo_refresh_token
    }

    json_response = JSON.parse(Faraday.post(url, body))

    update_user(json_response['access_token'], json_response['refresh_token'])

  end

  private

  def update_user(access_token, refresh_token)
    @user = current_user

    @user.update(
      monzo_access_token: access_token,
      monzo_refresh_token: refresh_token
    )
  end

  def import_from_monzo

    url = "https://api.monzo.com/transactions"

    body = {
      "Authorization" => "Bearer #{}",
      "account_id" => current_user
    }
    Faraday.get()




  end
end
