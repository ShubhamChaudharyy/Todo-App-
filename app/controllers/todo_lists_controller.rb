class TodoListsController < ApplicationController
    before_action :set_todo_list, only: [:show, :edit, :update, :destroy]
    
    def index
        @todo_lists = TodoList.all
    end
    
    def create
        @todo_list = TodoList.new(todo_list_params)
        respond_to do |format|
            @todo_list.save
            format.html {redirect_to todo_lists_url}
        end
    end
    
    def show
    end

    def new
        @todo_list = TodoList.new
    end

    def update
        respond_to do |format|
            @todo_list.update(todo_list_params)
            format.html { redirect_to todo_list_url}
        end
    end

    def destroy
        respond_to do |format|
            format.html {redirect_to todo_lists_url , notice: 'Todo list was successfully destroyed.'}  
        end  
    end
    
    private
    def set_todo_list
        @todo_list = TodoList.find(params[:id])
    end
    
    def todo_list_params
        params.require(:todo_list).permit(:title, :description)
    end
end