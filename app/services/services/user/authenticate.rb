module Services
    module User
      class Authenticate
        # Setup variables from .new
        def initialize(user)
          @user = user
        end
  
        # Run authenticate using call convention
        def call(password)
          # Guard statement
          # Automatically return if the user is not valid
          return false unless user
  
          # Check passsword using bcrypt
          if BCrypt::Password.new(user.password_digest) == password
            user
          else
            false
          end
        end
  
        private
  
        attr_accessor :user
      end
    end
  end