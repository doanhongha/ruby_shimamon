class RenameTagsTasksToTagTasks < ActiveRecord::Migration[5.1]
  def change
  	rename_table :tags_tasks, :tag_tasks
  end
end
