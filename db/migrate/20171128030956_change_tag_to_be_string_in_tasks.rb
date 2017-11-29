class ChangeTagToBeStringInTasks < ActiveRecord::Migration[5.1]
  def change
  	change_column :tasks, :tag, :string
  end
end
