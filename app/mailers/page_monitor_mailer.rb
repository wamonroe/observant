class PageMonitorMailer < ApplicationMailer
  before_action :set_page_monitor

  def alert
    mail(subject: "Alert: #{@page_monitor.name}")
  end

private

  def set_page_monitor
    @page_monitor = params[:page_monitor]
  end
end
