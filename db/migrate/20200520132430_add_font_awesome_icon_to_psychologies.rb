class AddFontAwesomeIconToPsychologies < ActiveRecord::Migration[6.0]
  def change
    add_column :psychologies, :font_awesome_icon, :string
  end
end
