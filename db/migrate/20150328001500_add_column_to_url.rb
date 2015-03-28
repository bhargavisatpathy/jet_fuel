class AddColumnToUrl < ActiveRecord::Migration
  def change
    add_column :urls, :popularity, :integer, default: 1
  end
end
