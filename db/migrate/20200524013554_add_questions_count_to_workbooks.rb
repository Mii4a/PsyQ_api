class AddQuestionsCountToWorkbooks < ActiveRecord::Migration[6.0]
  def self.up
    add_column :workbooks, :questions_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :workbooks, :questions_count
  end
end
