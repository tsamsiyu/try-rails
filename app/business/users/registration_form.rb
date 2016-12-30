require 'securerandom'
require 'digest/sha1'

module Business
  module Users
    class RegistrationForm < Components::FormObject
      model_class User

      attribute :email,     String
      attribute :password,  String

      validates :email,     presence: true, email: true, uniqueness: true, length: { maximum: 255 }
      validates :password,  presence: true, length: { in: 4..50 }

      def auth
        if valid?
          model.email = email
          model.password_hash = Digest::SHA1.hexdigest(password)
          model.authentication_token = SecureRandom.base58(24)
          model.save!
          {token: model.authentication_token}
        else
          errors
        end
      end
    end
  end
end