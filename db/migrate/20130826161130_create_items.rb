class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :list_id, null: false
      t.text :contents, null: false
      t.text :notes
      t.string :creator, null: false

      t.timestamps
    end
  end
end
