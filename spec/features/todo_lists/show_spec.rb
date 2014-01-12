require 'spec_helper'

feature "TodoList" do
  context "show" do
    before do
      @list = TodoList.create(name: 'Best Day Ever')

      @t1 = @list.todo_list_items.create(name: 'Michael Jackson zombie flash mob')
      @t2 = @list.todo_list_items.create(name: 'Rob Zombie pop singer flash mob')
      @t3 = @list.todo_list_items.create(name: 'Talk to DHH')
      @t4 = @list.todo_list_items.create(name: 'Finish todo app')

      visit todo_list_path(@list)
    end

    it "should display the Todo List's name" do
      page.should have_content @list.name
    end

    it "should display todo items" do
      within("#todos") do
        page.should have_content 'Talk to DHH'
        page.should have_content 'Michael Jackson zombie flash mob'
        page.should have_content 'Rob Zombie pop singer flash mob'
        page.should have_content 'Finish todo app'
      end
    end

    it "should have a form for creating new todos" do
      todo_name = 'See Keanu'

      fill_in(:content, with: todo_name)
      click_button('Create Todo')

      expect(page).to have_content(todo_name)
    end
  end
end
