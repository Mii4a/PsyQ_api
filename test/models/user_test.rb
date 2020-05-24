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
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
