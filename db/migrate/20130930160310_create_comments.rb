class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :creator
      t.integer :suggestion_id
      t.text :contents

      t.timestamps
    end
  end
end
