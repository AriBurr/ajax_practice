class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.string :power, default: ""
      t.belongs_to :game, foreign_key: true

      t.timestamps
    end
  end
end
