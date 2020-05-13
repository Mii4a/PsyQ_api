class AddSubjectImageToWorkbooks < ActiveRecord::Migration[6.0]
  def change
    add_column :workbooks, :subject_image, :string
  end
end
