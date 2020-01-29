class CreateDecks < ActiveRecord::Migration[5.2]
  def change
    create_table :decks do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
