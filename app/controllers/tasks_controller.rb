class TasksController < ApplicationController
	before_action :logged_in_user

	def new
		@task = Task.new
	end
	def index
    @tasks = Task.order('deadline ASC').where(assign: current_user.id)
    @tasks = Kaminari.paginate_array(@tasks).page(params[:page])
	end
	def create
		params[:task][:tag] = concatenate_tag_id params[:task][:tag]
		@task = current_user.tasks.new(task_params)
		if @task.save
			redirect_to tasks_path
		else
			render 'new'
		end
  end

	def concatenate_tag_id tags
		tags = tags.split(',')
		str_tag = ''
		tags.each do |tag|
			ex_tag = Tag.find_by(name: tag)
			if ex_tag
				str_tag =concatenate_tag str_tag, ex_tag
				next
			end
			new_tag = Tag.create(name: tag, content: tag)
			str_tag = concatenate_tag str_tag, new_tag
		end
		return str_tag
	end

	def concatenate_tag str_tag_id, tag
		if str_tag_id == ''
			str_tag_id = "#{tag.id}"
		else
			str_tag_id = "#{str_tag_id},#{tag.id}"
		end
		return str_tag_id
	end

	def edit
		set_task
	end

	def update
		set_task
		params[:task][:tag] = concatenate_tag_id params[:task][:tag]
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
    	redirect_back(fallback_location: root_path)
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
