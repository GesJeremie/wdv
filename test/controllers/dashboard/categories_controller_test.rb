require 'test_helper'

class Dashboard::CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dashboard_category = dashboard_categories(:one)
  end

  test "should get index" do
    get dashboard_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_dashboard_category_url
    assert_response :success
  end

  test "should create dashboard_category" do
    assert_difference('Dashboard::Category.count') do
      post dashboard_categories_url, params: { dashboard_category: { title: @dashboard_category.title } }
    end

    assert_redirected_to dashboard_category_url(Dashboard::Category.last)
  end

  test "should show dashboard_category" do
    get dashboard_category_url(@dashboard_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_dashboard_category_url(@dashboard_category)
    assert_response :success
  end

  test "should update dashboard_category" do
    patch dashboard_category_url(@dashboard_category), params: { dashboard_category: { title: @dashboard_category.title } }
    assert_redirected_to dashboard_category_url(@dashboard_category)
  end

  test "should destroy dashboard_category" do
    assert_difference('Dashboard::Category.count', -1) do
      delete dashboard_category_url(@dashboard_category)
    end

    assert_redirected_to dashboard_categories_url
  end
end
