require "test_helper"

class SchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @schedule = schedules(:one)
  end

  test "should get index" do
    get schedules_url
    assert_response :success
  end

  test "should get new" do
    get new_schedule_url
    assert_response :success
  end

  test "should create schedule" do
    assert_difference("Schedule.count") do
      post schedules_url, params: { schedule: { friday_end: @schedule.friday_end, friday_start: @schedule.friday_start, monday_end: @schedule.monday_end, monday_start: @schedule.monday_start, thursday_end: @schedule.thursday_end, thursday_start: @schedule.thursday_start, tuesday_end: @schedule.tuesday_end, tuesday_start: @schedule.tuesday_start, wednesday_end: @schedule.wednesday_end, wednesday_start: @schedule.wednesday_start } }
    end

    assert_redirected_to schedule_url(Schedule.last)
  end

  test "should show schedule" do
    get schedule_url(@schedule)
    assert_response :success
  end

  test "should get edit" do
    get edit_schedule_url(@schedule)
    assert_response :success
  end

  test "should update schedule" do
    patch schedule_url(@schedule), params: { schedule: { friday_end: @schedule.friday_end, friday_start: @schedule.friday_start, monday_end: @schedule.monday_end, monday_start: @schedule.monday_start, thursday_end: @schedule.thursday_end, thursday_start: @schedule.thursday_start, tuesday_end: @schedule.tuesday_end, tuesday_start: @schedule.tuesday_start, wednesday_end: @schedule.wednesday_end, wednesday_start: @schedule.wednesday_start } }
    assert_redirected_to schedule_url(@schedule)
  end

  test "should destroy schedule" do
    assert_difference("Schedule.count", -1) do
      delete schedule_url(@schedule)
    end

    assert_redirected_to schedules_url
  end
end
