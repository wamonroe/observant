class PageMonitorEvent < ApplicationEvent
  def if?(_time)
    record.enabled
  end

  def ignored_attributes
    %i[content previous_content last_checked_at updated_at]
  end
end
