class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :status
      t.datetime :deadline
      t.integer :priority
      t.integer :tag
      t.integer :assign
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
