# frozen_string_literal: true

class User < ApplicationRecord
  validates :name
  validates :email
  validates :password
  validates :password_confirmation
  has_secure_token
end
