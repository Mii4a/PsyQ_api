# frozen_string_literal: true

class CreatePreferenceRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :preference_relationships do |t|
      t.integer :user_id
      t.integer :workbook_id

      t.timestamps
    end
    add_index :preference_relationships, :user_id
    add_index :preference_relationships, :workbook_id
    add_index :preference_relationships, %i[user_id workbook_id], unique: true
  end
end
