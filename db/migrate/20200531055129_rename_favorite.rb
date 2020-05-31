class RenameFavorite < ActiveRecord::Migration[5.2]
  def change
    rename_table :favorites, :favolites
  end
end
