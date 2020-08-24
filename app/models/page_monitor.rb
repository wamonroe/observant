class PageMonitor < ApplicationRecord
  after_create :request_update

  validates :url, presence: true
  validates :name, presence: true
  validates :frequency, presence: true,
    numericality: { only_integer: true, greater_than_or_equal_to: 600 }
  validate :validate_url_reachable

  def request_update
    UpdatePageMonitorJob.perform_later(self)
  end

private

  def validate_url_reachable
    HTTParty.get(url)
  rescue StandardError
    errors.add(:url, 'unable to connect')
  end
end
