class WhvCustomer < Customer
  EVENTS = [
    "login",
    "signup",
    "apply_now",
    "personal1",
    "personal2",
    "personal3",
    "medical1",
    "character",
    "whv_specific",
    "submit",
    "pay"
  ]

  EVENTS.each do |event|
    define_method "#{event}_did_succeed!" do
      Spawnling.new do
        application_events.create!(
          name: event,
          successful: true
        )

        Pusher.trigger('whv_customers', "did_succeed", {
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

        Pusher.trigger('whv_customers', "did_fail", {
          id: id,
          event: event,
          message: message
        })
      end
    end

    define_method "failed_#{event}?" do
      application_events.where(name: event).most_recent_first.first.try!(:failed?)
    end
  end
end
