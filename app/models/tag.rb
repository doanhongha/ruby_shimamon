class Tag < ApplicationRecord
	has_and_belongs_to_many :tasks, join_table: 'tags_tasks'     
end