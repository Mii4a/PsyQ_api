class AddFieldToPsychologies < ActiveRecord::Migration[6.0]
  def change
    add_column :psychologies, :field, :string
  end
end
