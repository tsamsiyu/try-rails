class Users::RegistrationsController < ApplicationController
  def create
    form = Business::Users::RegistrationForm.new params.require(:registration)
    respond_with form.auth
  end
end