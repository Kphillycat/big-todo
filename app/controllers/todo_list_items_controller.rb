class TodoListItemsController < ApplicationController
	def create
		todolist = TodoList.find(params[:todo_list_id])
		todolist.todo_list_items.create(params[:todo_list_item])
		redirect_to "/todo_lists/#{todolist.id}"
	end
end