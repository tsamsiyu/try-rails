class ApplicationController < ActionController::API
  respond_to :xml, :json

  before_action AuthFilter
  before_action ContentTypeFilter
end