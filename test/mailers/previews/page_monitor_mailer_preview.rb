class PageMonitorMailerPreview < ActionMailer::Preview
  def alert
    PageMonitorMailer.with(page_monitor: PageMonitor.first).alert
  end
end
