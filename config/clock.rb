require 'clockwork'
require 'clockwork/database_events'
require_relative 'boot'
require_relative 'environment'

module Clockwork
  # configuration
  Clockwork.manager = DatabaseEvents::Manager.new
  configure do |config|
    config[:logger] = Logger.new(Rails.root.join("log/#{Rails.env}_clockwork.log"))
  end

  # == Run Dynamic Events
  sync_database_events model: PageMonitorEvent, every: 1.minute do |event_object|
    log_around('UpdatePageMonitorJob') do
      UpdatePageMonitorJob.perform_later(event_object.record)
    end
  end

  # ==> Define Static Events
  # perform_every(1.hour, 'SomeJob') do
  #   SomeJob.perform_later(args)
  # end

  # ==> Helper Methods
  def self.perform_every(period, job_name, options={}, &block)
    every(period, job_name, options) do
      log_around(job_name, &block)
    end
  end

  def self.log_around(job_name)
    logger.info "Running #{job_name}..."
    yield
    logger.info "#{job_name} complete."
  end

  def self.logger
    Clockwork.manager.logger
  end
end
