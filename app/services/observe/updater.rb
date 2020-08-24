module Observe
  class Updater
    attr_accessor :page_monitor

    def initialize(page_monitor)
      @page_monitor = page_monitor
    end

    def call
      # Get the latest content
      latest_content = scraper.call

      # Update the page monitor
      updates = { last_checked_at: DateTime.now }
      unless latest_content == page_monitor.content
        updates[:content] = latest_content
        updates[:previous_content] = page_monitor.content
      end
      page_monitor.update(updates)

      # Send an alert if the page monitor's content was updated
      send_alert if updates.key?(:content)
    end

    def self.call(page_monitor)
      new(page_monitor).call
    end

  private

    def send_alert
      PageMonitorMailer.with(page_monitor: page_monitor).alert.deliver_later
    end

    def scraper
      Scraper.new(page_monitor)
    end
  end
end
