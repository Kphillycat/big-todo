class TodoList < ActiveRecord::Base
	attr_accessible :name
	has_many :todo_list_items
end
