class RenameColumnUrlToLongUrl < ActiveRecord::Migration
  def change
    rename_column :urls, :url, :long
  end
end
