class User < ApplicationRecord
  self.table_name = "portal_users"

  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :role, inclusion: { in: %w[admin user] }

  before_save { self.email = email.downcase }

  def admin?
    role == "admin"
  end
end
