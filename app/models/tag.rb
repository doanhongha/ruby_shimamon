class Tag < ApplicationRecord
	validates :name, uniqueness: true
	has_many :tag_tasks
	has_many :tasks, through: :tag_tasks
	# has_and_belongs_to_many :tasks, join_table: 'tag_tasks'     
end