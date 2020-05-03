class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :question_explanation
      t.preference :workbook_id

      t.timestamps
    end
  end
end
