class User < ApplicationRecord
    has_secure_password
    has_many :articles
    before_save {self.email = email.downcase}
    
    validates :username, :email, presence: true, uniqueness: {caase_sensitive: false} 
    
    VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    validates :email, format: {with: VALID_EMAIL}
    validates :password, confirmation: { case_sensitive: true }
end
