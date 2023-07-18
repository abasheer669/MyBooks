class User < ApplicationRecord
    has_many :books, dependent: :destroy

    EMAIL_REGEX = /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i
    validates :username,:email ,:password, presence: true
    validates :username, :email, uniqueness: true
    validates :password, length: {in: 5..15}
    validates_format_of  :email, with: EMAIL_REGEX

end
