class Task < ApplicationRecord
	validates :name, presence: true, length: {in: 4..255}
	validates :status, presence: true
	validates :priority, presence: true
	# validates :tag, presence: true
	validates :assign, presence: true


	has_and_belongs_to_many :tags, join_table: 'tags_tasks'
	belongs_to :user, class_name: 'User', foreign_key: :assign
	STATUS_HASH = {'1' => 'not started', '2' => 'undertaken', '3' => 'completed'}
  	PRIORITY_HASH = {'1' => 'low', '2' => 'medium', '3' => 'high'}

end
