class API::V1::TodosController < ApplicationController
  before_filter :load_todo, only: [:update, :destroy]

  def index
    @todos = Todo.all
    render json: @todos
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.save
    render json: @todo, status: :created
  end

  def update
    @todo.update(todo_params)
  end

  def destroy
    @todo.destroy
    render json: @todo, status: :no_content
  end


  private

  def load_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.permit(:title, :completed, :order)
  end
end
