class Users::RegistrationsController < Devise::RegistrationsController
  def create
    form = Business::Users::RegistrationForm.new params.require(:registration)
    form.auth
  end
end