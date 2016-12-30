module Business
  module Users
    class RegistrationForm < Components::Form
      model_class User
      attributes :email, :password

      validates :email, :password,  presence: true
      validates :email,             email: true, uniqueness: true

      def auth
        pp attributes

        if valid?

        else

        end
      end
    end
  end
end