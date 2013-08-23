class AddCreatorToLists < ActiveRecord::Migration
  def change
    add_column :lists, :creator, :string, null: false
    change_column :lists, :title, :text, null: false
  end
end
