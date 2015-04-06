class Rater < ActiveRecord::Base
 	before_save { self.email = email.downcase }
	validates :name, presence: true
	validates :email, presence: true
	validates :atype, presence: true


	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

    has_secure_password
    validates :password, length: { minimum: 4 }
end
