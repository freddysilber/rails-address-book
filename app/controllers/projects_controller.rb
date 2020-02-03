class ProjectsController < ApplicationController
	def index
		@projects = []
		Project.all.each do |p|
			if p.account.user_id == current_user.id
				@projects << p
			end
		end
		@project = self.new
	end	

	def new
		@project = Project.new
	end


	def create
		project = Project.new(project_params)
		project.project_name = project_params[:project_name].capitalize
		if project.valid?
			project.save
			redirect_to '/projects'
		else
			raise
		end
	end

	def show
		@project = Project.find(params[:id])
		@tasks = []
		Task.all.each do |t|
			if t.project_id == @project.id
				@tasks << t
			end
		end
		if @project.account.user_id == current_user.id
			render 'show'
		end
	end

	def edit
		@project = Project.find(params[:id])
		if @project.account.user_id == current_user.id
			render 'edit'
		end
	end

	def update
		@project = Project.find(params[:id])
		@project.update(project_params)
		redirect_to project_path(@project)
	end

	def destroy
		# Project.find(params[:id]).destroy
		project = Project.find(params[:id])
		project.tasks.destroy
		project.destroy
		redirect_to '/projects'
	end

	private

	def project_params
		params.require(:project).permit(
			:project_name,
			:account_id,
			:owner,
			:complete
		)
	end
end