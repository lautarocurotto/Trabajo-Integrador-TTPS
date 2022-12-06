require "application_system_test_case"

class SchedulesTest < ApplicationSystemTestCase
  setup do
    @schedule = schedules(:one)
  end

  test "visiting the index" do
    visit schedules_url
    assert_selector "h1", text: "Schedules"
  end

  test "should create schedule" do
    visit schedules_url
    click_on "New schedule"

    fill_in "Friday end", with: @schedule.friday_end
    fill_in "Friday start", with: @schedule.friday_start
    fill_in "Monday end", with: @schedule.monday_end
    fill_in "Monday start", with: @schedule.monday_start
    fill_in "Thursday end", with: @schedule.thursday_end
    fill_in "Thursday start", with: @schedule.thursday_start
    fill_in "Tuesday end", with: @schedule.tuesday_end
    fill_in "Tuesday start", with: @schedule.tuesday_start
    fill_in "Wednesday end", with: @schedule.wednesday_end
    fill_in "Wednesday start", with: @schedule.wednesday_start
    click_on "Create Schedule"

    assert_text "Schedule was successfully created"
    click_on "Back"
  end

  test "should update Schedule" do
    visit schedule_url(@schedule)
    click_on "Edit this schedule", match: :first

    fill_in "Friday end", with: @schedule.friday_end
    fill_in "Friday start", with: @schedule.friday_start
    fill_in "Monday end", with: @schedule.monday_end
    fill_in "Monday start", with: @schedule.monday_start
    fill_in "Thursday end", with: @schedule.thursday_end
    fill_in "Thursday start", with: @schedule.thursday_start
    fill_in "Tuesday end", with: @schedule.tuesday_end
    fill_in "Tuesday start", with: @schedule.tuesday_start
    fill_in "Wednesday end", with: @schedule.wednesday_end
    fill_in "Wednesday start", with: @schedule.wednesday_start
    click_on "Update Schedule"

    assert_text "Schedule was successfully updated"
    click_on "Back"
  end

  test "should destroy Schedule" do
    visit schedule_url(@schedule)
    click_on "Destroy this schedule", match: :first

    assert_text "Schedule was successfully destroyed"
  end
end
