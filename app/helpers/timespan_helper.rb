module TimespanHelper
  TIMESPAN_PERIODS = {
    'day' => 86_400,
    'hour' => 3_600,
    'minute' => 60
  }.freeze

  def humanize_seconds(seconds)
    seconds = seconds.to_i if seconds.is_a?(ActiveSupport::Duration)

    return 'now' if seconds.zero?

    results = TIMESPAN_PERIODS.map do |name, span|
      next if span > seconds

      amount, seconds = seconds.divmod(span)
      pluralize(amount, name)
    end
    results.compact.to_sentence
  end
end
