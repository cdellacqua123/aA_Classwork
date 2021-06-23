class User < ApplicationRecord
    validates :email, uniqueness: true
    attr_reader :password

    # after_initialize :reset_session_token!

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
        return nil if user.nil?
        if user.check_password(password)
            user
        else
            nil
        end
    end

    def check_password(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save!
        self.session_token
    end

    def self.generate_session_token
        SecureRandom.base64(64)
    end

    private

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end
end