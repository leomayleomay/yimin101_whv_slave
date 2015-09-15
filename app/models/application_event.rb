class ApplicationEvent < ActiveRecord::Base
  belongs_to :customer

  scope :most_recent_first, -> { order("created_at DESC") }
  scope :payment_successful, -> { where(name: "pay", successful: true) }

  def failed?
    !successful?
  end
end
