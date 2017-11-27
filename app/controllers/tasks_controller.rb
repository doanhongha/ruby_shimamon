class TasksController < ApplicationController
	before_action :logged_in_user
	def new
		@task = Task.new
	end
	def index
		@tasks = Task.order('deadline ASC').all
	end
	def create
		@task = current_user.tasks.new(task_params)
		if @task.save
			redirect_to tasks_path
		else
			render 'new'
		end
	end

	def edit
		set_task
	end

	def update
		set_task
		if @task.update_attributes(task_params)
			redirect_to task_path
		else
			redirect_to tasks_path
		end
	end

	def show
		set_task
	end

	def destroy
		set_task
		@task.destroy
		redirect_to tasks_path
	end

	def set_deadline
		set_task
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :description, :status, :deadline, :priority, :tag, :assign, :deleted_at)
    end
end
