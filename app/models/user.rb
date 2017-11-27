class User < ApplicationRecord
	validates :email, length: {in: 4..255}, presence: true, uniqueness: {case_sensitive: false}, 
	format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "Format error!"}

	validates :name, presence: true, length: {in: 4..255}

	has_secure_password
	has_many :tasks,class_name: 'Task', foreign_key: :assign

	# after_destroy :delete_tasks
	# def delete_tasks
	# 	@tasks = Task.where(assign: current_user.id)
	# 	@tasks = 
	# end

end
