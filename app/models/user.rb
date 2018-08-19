class User < ApplicationRecord
    has_secure_password

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
      end

    validates_uniqueness_of :email
    validates_uniqueness_of :username
end
