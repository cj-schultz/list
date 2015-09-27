class AddFieldsToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :complete, :boolean
  end
end
