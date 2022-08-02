class RenameEndColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :end, :end_day
  end
end
