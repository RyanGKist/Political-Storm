class User < ApplicationRecord
    
    include Users::Confirmable

    before_save :downcase_email

    has_secure_password

    validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: /@/ }

    scope :newest, -> { order(created_at: :desc) }

    private

    def downcase_email
        self.email.downcase! if self.email.present?
    end
end
