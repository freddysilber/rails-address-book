class TasksController < ApplicationController
	TASK_STATUS = [
		'Open',
		'In Progress',
		'Complete'
	]
	def index
		@tasks = Task.all
	end

	def new
		@task = Task.new
	end

	def create
		task = Task.new(task_params)
		task.save
		redirect_to '/tasks'
		# raise task_params
		# task_params[:'start_date(1i)'] => "2020"

		# task = Task.new(task_params)
		# task.task_name = task_params[:task_name].capitalize
		# if task.valid?
		# 	task.save
		# 	redirect_to '/tasks'
		# else
		# 	raise
		# end
	end

	def show
		@task = Task.find(params[:id])
		if @task.project.account.user_id == current_user.id
			render 'show'
		end
	end

	def edit
		@task = Task.find(params[:id])
		if @task.project.account.user_id == current_user.id
			render 'edit'
		end
	end	

	def update
		@task = Task.find(params[:id])
		@task.update(task_params)
		redirect_to task_path(@task)
	end

	private
	
	def task_params
		params.require(:task).permit(
			:task_name,
			:project_id,
			:complete,
			:status,
			# :start_date,
			# :end_date
		)
	end
end