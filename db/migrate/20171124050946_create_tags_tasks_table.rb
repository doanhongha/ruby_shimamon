class CreateTagsTasksTable < ActiveRecord::Migration[5.1]
  def change
    create_table :tags_tasks do |t|
      t.references :tag, foreign_key: true
      t.references :task, foreign_key: true
    end
  end
end
