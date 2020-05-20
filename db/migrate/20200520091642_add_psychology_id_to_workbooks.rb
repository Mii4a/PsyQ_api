class AddPsychologyIdToWorkbooks < ActiveRecord::Migration[6.0]
  def change
    add_column :workbooks, :psychology_id, :integer
  end
end
