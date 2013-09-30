class RemoveNotesFromSuggestions < ActiveRecord::Migration
  def change
    remove_column :suggestions, :notes, :text
  end
end
