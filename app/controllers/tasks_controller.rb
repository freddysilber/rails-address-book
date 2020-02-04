class TasksController < ApplicationController
	before_action :set_task!, only: [:show, :edit, :update]

	def index
		@tasks = Task.all
		@task = self.new
	end

	def new
		# @task = Task.new
		@task = Task.new(project_id: params[:project_id])
		# @contact = Contact.new(account_id: params[:account_id])
	end

	def create
		@task = Task.new(task_params)
		if @task.save
			redirect_to task_path(@task)
		else
			render :new
		end
	end

	def show
		if @task.project.account.user_id == current_user.id
			render 'show'
		end
	end

	def edit
		if @task.project.account.user_id == current_user.id
			render 'edit'
		end
	end	

	def update
		if @task.update(task_params)
			redirect_to task_path(@task)
		else
			render :edit
		end
	end

	def destroy
		Task.find(params[:id]).destroy
		redirect_to '/tasks'
	end

	private
	
	def task_params
		params.require(:task).permit(
			:task_name,
			:project_id,
			:complete,
			:status,
			:start_date,
			:end_date
		)
	end

	def set_task!
		@task = Task.find(params[:id])
	end
end