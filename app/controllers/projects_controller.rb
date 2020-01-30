class ProjectsController < ApplicationController
	def index
		@projects = Project.all
		@project = self.new
	end	

	def new
		@project = Project.new
	end
end