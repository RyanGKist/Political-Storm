module Users
    module Confirmable
      extend ActiveSupport::Concern
  
      included do
        before_create :generate_confirmation_token
      end
  
      private
  
      def generate_confirmation_token
        self.confirmation_token = SecureRandom.uuid()
      end
    end
  end