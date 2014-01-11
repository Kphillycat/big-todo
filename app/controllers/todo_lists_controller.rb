class TodoListsController < ApplicationController
	def index
		@todos = TodoList.all
	end

	def show
		@todo = TodoList.find(params[:id])
	end

	def create
		@todo = TodoList.create(params[:todo_list])
		redirect_to @todo
	end
end
