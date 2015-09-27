class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.datetime :due_date
      t.text :description
      t.references :group, index: true

      t.timestamps
    end
  end
end
