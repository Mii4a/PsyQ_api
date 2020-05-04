class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :explanation
      t.references :workbook

      t.timestamps
    end
  end
end
