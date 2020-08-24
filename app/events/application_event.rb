class ApplicationEvent
  class << self
    def all
      model_name.constantize.all.map { |record| new(record) }
    end

    def model_name
      name.delete_suffix('Event')
    end

    def delegate_optional(*methods, to:)
      methods.each do |method|
        define_method(method) do
          return unless to.respond_to?(method)

          to.public_send(method)
        end
      end
    end
  end

  attr_reader :record

  delegate :frequency, :attributes, to: :record
  delegate_optional :at, :name, :ignored_attributes, :skip_first_run, to: :record

  def initialize(record)
    @record = record
  end

  def id
    "#{model_name.underscore}_#{record.id}"
  end

  def at
    return unless record.respond_to?(:at)

    record.at
  end

  def name
    return unless record.respond_to?(:name)

    record.name
  end

  def if?(time)
    return true unless record.respond_to?(:if?)

    record.public_send(:if, time)
  end

  def tz
    'UTC'
  end

private

  def model_name
    self.class.model_name
  end
end
