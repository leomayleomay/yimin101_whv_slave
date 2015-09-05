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
          event: event,
          success_ratio: success_ratio.to_s,
          failure_ratio: failure_ratio.to_s,
          unknown_ratio: unknown_ratio.to_s
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
          message: message,
          success_ratio: success_ratio.to_s,
          failure_ratio: failure_ratio.to_s,
          unknown_ratio: unknown_ratio.to_s
        })
      end
    end

    define_method "did_#{event}?" do
      application_events.where(name: event).most_recent_first.first.try!(:successful?)
    end

    define_method "failed_#{event}?" do
      application_events.where(name: event).most_recent_first.first.try!(:failed?)
    end
  end

  def success_ratio
    (EVENTS.count {|event| send("did_#{event}?")}.to_f / EVENTS.count * 100).to_i
  end

  def failure_ratio
    (EVENTS.count {|event| send("failed_#{event}?")}.to_f / EVENTS.count * 100).to_i
  end

  def unknown_ratio
    100 - success_ratio - failure_ratio
  end
end
