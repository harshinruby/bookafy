require 'test_helper'

class WorkHoursControllerTest < ActionController::TestCase
  setup do
    @work_hour = work_hours(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:work_hours)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create work_hour" do
    assert_difference('WorkHour.count') do
      post :create, work_hour: { day: @work_hour.day, end_time: @work_hour.end_time, start_time: @work_hour.start_time }
    end

    assert_redirected_to work_hour_path(assigns(:work_hour))
  end

  test "should show work_hour" do
    get :show, id: @work_hour
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @work_hour
    assert_response :success
  end

  test "should update work_hour" do
    patch :update, id: @work_hour, work_hour: { day: @work_hour.day, end_time: @work_hour.end_time, start_time: @work_hour.start_time }
    assert_redirected_to work_hour_path(assigns(:work_hour))
  end

  test "should destroy work_hour" do
    assert_difference('WorkHour.count', -1) do
      delete :destroy, id: @work_hour
    end

    assert_redirected_to work_hours_path
  end
end
