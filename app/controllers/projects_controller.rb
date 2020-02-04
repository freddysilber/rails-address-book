class ProjectsController < ApplicationController
	before_action :set_project!, only: [:show, :edit, :update]

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
		@project = Project.new(account_id: params[:account_id])
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			redirect_to project_path(@project)
		else
			render :new
		end
	end

	def show
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
		if @project.account.user_id == current_user.id
			render 'edit'
		end
	end

	def update
		if @project.update(project_params)
			redirect_to project_path(@project)
		else
			render :edit
		end
	end

	def destroy
		Project.find(params[:id]).destroy
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

	def set_project!
		@project = Project.find(params[:id])
	end
end