# frozen_string_literal: true

class RemovePasswordConfirmationFronUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :password_confirmation, :string
  end
end
