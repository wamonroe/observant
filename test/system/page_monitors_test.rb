require "application_system_test_case"

class PageMonitorsTest < ApplicationSystemTestCase
  setup do
    @page_monitor = page_monitors(:one)
  end

  test "visiting the index" do
    visit page_monitors_url
    assert_selector "h1", text: "PageMonitors"
  end

  test "creating a PageMonitor" do
    visit page_monitors_url
    click_on "New PageMonitor"

    click_on "Create PageMonitor"

    assert_text "PageMonitor was successfully created"
    click_on "Back"
  end

  test "updating a PageMonitor" do
    visit page_monitors_url
    click_on "Edit", match: :first

    click_on "Update PageMonitor"

    assert_text "PageMonitor was successfully updated"
    click_on "Back"
  end

  test "destroying a PageMonitor" do
    visit page_monitors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "PageMonitor was successfully destroyed"
  end
end
