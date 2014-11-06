require 'test_helper'

class API::V1::TodosControllerTest < ActionController::TestCase
  setup do
  	@todo = todos(:one)
  end

  test "should GET #index" do
    get :index
	assert_response(:ok)
	assert_not_nil assigns(:todos)
  end

  test "should POST #create" do 
  	post :create, todo: { title: @todo.title, order: @todo.order, completed: @todo.completed}

  	assert_response(:created)
  end

  test "should PUT #update" do
  	put :update, id: @todo, todo: { title: @todo.title, order: @todo.order, completed: @todo.completed}
  	assert_response(:ok)
  end

  test "should DELETE #destroy" do
  	assert_difference('Todo.count', -1) do
  		delete :destroy, id: @todo
  	end

  	assert_response 204
  end

end
