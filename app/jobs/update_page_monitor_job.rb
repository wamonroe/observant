class UpdatePageMonitorJob < ApplicationJob
  queue_as :page_monitor

  def perform(page_monitor)
    Observe::Updater.call(page_monitor)
  end
end
