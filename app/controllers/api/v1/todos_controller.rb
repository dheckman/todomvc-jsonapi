class API::V1::TodosController < ApplicationController

  def index
    @todo = Todo.all
    render json: @todo
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.save
    render json: @todo, status: :created
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update(todo_params)
  end

  def destroy
    @todo = Todo.find_by(params[:id])
    @todo.destroy
  end


  private

  def todo_params
    params.permit(:title, :completed, :order)
  end
end
