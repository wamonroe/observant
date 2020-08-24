module Observe
  class Scraper
    attr_accessor :url, :selections

    def initialize(page_monitor=nil, options={})
      @url = page_monitor&.url || options[:url]
      @selections = page_monitor&.selections || options[:selections]
    end

    def call
      content.flatten.join("\n")
    end

    def self.call(page_monitor)
      new(page_monitor).call
    end

  private

    def content
      selections.map do |selection|
        page.xpath(selection).text.lines.map(&:strip).reject(&:blank?)
      end
    end

    def response
      HTTParty.get(url)
    end

    def page
      Nokogiri::HTML(response&.response&.body)
    end
  end
end
