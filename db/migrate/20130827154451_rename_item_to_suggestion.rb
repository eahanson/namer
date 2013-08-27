class RenameItemToSuggestion < ActiveRecord::Migration
  def change
    rename_table :items, :suggestions
  end
end
