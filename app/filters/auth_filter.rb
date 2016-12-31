class AuthFilter
  TOKEN_REGEXP = /Bearer\s(\w{24})/

  def self.before(controller)
    authorize controller
  end

  def self.authorize(controller)
    request = controller.request
    if (bearer = request['Authorization'])
      if (matches = TOKEN_REGEXP.match(bearer))
        set_app_user matches[1], controller
      end
    end
  end

  def self.set_app_user(token, controller)
    if (user = User.find_by_authentication_token token)
      controller.app_user = AppUser.new user
    end
  end
end