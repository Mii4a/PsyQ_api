# frozen_string_literal: true

# User class
class User < ApplicationRecord
  has_many :preference_relationships, dependent: :destroy
  has_many :liked_workbooks, through: :preference_relationships,
                             source: :workbook
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  VALID_PASSWORD_REGEX = /\A[a-zA-z0-9]+\z/i.freeze
  validates :password, presence: true,
                       length: { in: 6..20 },
                       format: { with: VALID_PASSWORD_REGEX }
  has_secure_token
end

# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  is_admin        :boolean          default(FALSE)
#  name            :string
#  password_digest :string
#  token           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#  index_users_on_token  (token) UNIQUE
#
