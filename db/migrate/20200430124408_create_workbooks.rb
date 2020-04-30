class CreateWorkbooks < ActiveRecord::Migration[6.0]
  def change
    create_table :workbooks do |t|
      t.string :subject_name
      t.text :subject_explanation

      t.timestamps
    end
  end
end
