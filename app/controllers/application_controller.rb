class ApplicationController < ActionController::Base
  respond_to :xml, :json

  # protect_from_forgery with: :exception
  before_action :authenticate
  before_action :recognize_content_type

  protected

  def authenticate
    # authenticate_or_request_with_http_basic do |username, password|
    #   username == "foo" && password == "bar"
    # end
  end

  def recognize_content_type
    if request.headers['Content-Type'] == 'application/json'
      request.format = :json
    elsif request.headers['Content-Type'] == 'application/xml'
      request.format = :xml
    end
  end
end
