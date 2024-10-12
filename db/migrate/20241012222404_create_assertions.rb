class CreateAssertions < ActiveRecord::Migration[7.2]
  def change
    create_table :assertions do |t|
      t.string :url, null: false
      t.text :text, null: false
      t.integer :status, null: false
      t.integer :links_count, null: false
      t.integer :images_count, null: false

      t.timestamps
    end
  end
end
