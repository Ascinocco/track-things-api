# app/models/user.rb
class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # Model associations
  has_many :todos, foreign_key: :created_by
  # Validations
  validates_presence_of :name, :email, :password_digest
  validates :email, presence: true, uniqueness: true

  def get_sanitized_user
    return {
      name: self.name,
      email: self.email
    };
  end
end
