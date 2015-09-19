module EventHandler
  extend ActiveSupport::Concern

  included do |base|
    base.events.each do |event|
      define_method "#{event}_did_succeed!" do
        Spawnling.new do
          save! if event == "apply_now"

          application_events.create!(
            name: event,
            successful: true
          )

          Pusher.trigger('customers', "did_succeed", {
            id: id,
            event: event
          })
        end
      end

      define_method "#{event}_did_fail_with_error!" do |message, backtrace|
        Spawnling.new do
          application_events.create!(
            name: event,
            successful: false,
            message: message,
            backtrace: backtrace
          )

          Pusher.trigger('customers', "did_fail", {
            id: id,
            event: event,
            message: message
          })
        end
      end

      define_method "#{event}_failed?" do
        application_events.where(name: event).most_recent_first.first.try!(:failed?)
      end
    end
  end
end