# frozen_string_literal: true

class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.text :option
      t.boolean :is_answer
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
    add_index :answers, :option
  end
end
