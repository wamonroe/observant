require 'test_helper'

class PageMonitorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @page_monitor = page_monitors(:one)
  end

  test "should get index" do
    get page_monitors_url
    assert_response :success
  end

  test "should get new" do
    get new_page_monitor_url
    assert_response :success
  end

  test "should create page_monitor" do
    assert_difference('PageMonitor.count') do
      post page_monitors_url, params: { page_monitor: {  } }
    end

    assert_redirected_to page_monitor_url(PageMonitor.last)
  end

  test "should show page_monitor" do
    get page_monitor_url(@page_monitor)
    assert_response :success
  end

  test "should get edit" do
    get edit_page_monitor_url(@page_monitor)
    assert_response :success
  end

  test "should update page_monitor" do
    patch page_monitor_url(@page_monitor), params: { page_monitor: {  } }
    assert_redirected_to page_monitor_url(@page_monitor)
  end

  test "should destroy page_monitor" do
    assert_difference('PageMonitor.count', -1) do
      delete page_monitor_url(@page_monitor)
    end

    assert_redirected_to page_monitors_url
  end
end
