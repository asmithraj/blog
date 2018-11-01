class User < ApplicationRecord
	has_secure_password
	validates :email, uniqueness: true, presence: true
	enum role: [:guest, :editor, :admin]
end
