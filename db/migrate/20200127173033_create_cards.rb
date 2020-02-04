class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :question
      t.string :answer
      t.boolean :correct, default: nil
      t.references :deck
      t.timestamps
    end
  end
end
