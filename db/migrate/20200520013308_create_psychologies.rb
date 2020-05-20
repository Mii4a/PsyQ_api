class CreatePsychologies < ActiveRecord::Migration[6.0]
  def change
    create_table :psychologies do |t|
      t.string :category
      t.text :explanation

      t.timestamps
    end
  end
end
