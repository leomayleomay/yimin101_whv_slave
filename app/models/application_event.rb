class ApplicationEvent < ActiveRecord::Base
  belongs_to :customer

  scope :most_recent_first, -> { order("created_at DESC") }

  def failed?
    !successful?
  end
end
