require 'google/apis/people_v1'
require 'google/api_client/client_secrets.rb'
class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  People = Google::Apis::PeopleV1
  helper_method :current_cart

  def contacts
    secrets = Google::APIClient::ClientSecrets.new(
    {
      "web" =>
      {
        "access_token" => current_user.token,
        "refresh_token" => current_user.refresh_token,
        "client_id" => ENV["GOOGLE_APP_ID"],
        "client_secret" => ENV["GOOGLE_APP_SECRET"]
      }
    }
    )
    service = People::PeopleServiceService.new
    service.authorization = secrets.to_authorization
    response = service.list_person_connections(
      'people/me',
      person_fields: ['names', 'emailAddresses', 'phoneNumbers']
      )
    render json: response
  end

  def current_cart
    if session[:cart_id]
      @current_cart ||= Cart.where('id=?', session[:cart_id]).first
      session[:cart_id] = nil if @current_cart.nil?
    end
    if session[:cart_id].nil?
      @current_cart = Cart.create!
      session[:cart_id] = @current_cart.id
    end
    @current_cart
  end
end