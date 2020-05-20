class CreatePsychologies < ActiveRecord::Migration[6.0]
  def change
    create_table :psychologies do |t|
      t.string :category
      t.text :explanation

      t.timestamps
    end
    add_index :psychologies, :category
    add_index :psychologies, :explanation
  end
end
