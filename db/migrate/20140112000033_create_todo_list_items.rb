class CreateTodoListItems < ActiveRecord::Migration
  def change
    create_table :todo_list_items do |t|
    	t.belongs_to :todo_lists
    	t.string :content
    	t.integer :todo_list_id
    	t.timestamps
    end
  end
end
