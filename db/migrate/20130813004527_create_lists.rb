class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.text :title
      t.text :notes

      t.timestamps
    end
  end
end
