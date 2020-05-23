class AddJapaneseFieldNameToPsychologies < ActiveRecord::Migration[6.0]
  def change
    add_column :psychologies, :japanese_field_name, :string
  end
end
