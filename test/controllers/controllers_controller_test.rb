require "test_helper"

class ControllersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @controller = controllers(:one)
  end

  test "should get index" do
    get controllers_url, as: :json
    assert_response :success
  end

  test "should create controller" do
    assert_difference("Controller.count") do
      post controllers_url, params: { controller: { categories: @controller.categories } }, as: :json
    end

    assert_response :created
  end

  test "should show controller" do
    get controller_url(@controller), as: :json
    assert_response :success
  end

  test "should update controller" do
    patch controller_url(@controller), params: { controller: { categories: @controller.categories } }, as: :json
    assert_response :success
  end

  test "should destroy controller" do
    assert_difference("Controller.count", -1) do
      delete controller_url(@controller), as: :json
    end

    assert_response :no_content
  end
end
