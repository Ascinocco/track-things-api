class CreateThings < ActiveRecord::Migration[5.2]
  def change
    create_table :things do |t|
      t.string :title
      t.string :details
      t.string :created_by
      t.string :finishes_on
      t.string :image
      t.json :reminders

      t.timestamps
    end
  end
end
