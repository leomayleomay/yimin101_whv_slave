require "capybara"
require "capybara/dsl"
require "capybara-webkit"

Capybara.run_server = false
Capybara.current_driver = :webkit

module Task
  class Error < StandardError; end

  class Base
    include Capybara::DSL

    attr_reader :customer

    def initialize(customer)
      @customer = customer
    end

    def execute
      return if executed?

      begin
        do_execute

        succeed!
      rescue => e
        # Capybara::Screenshot.screenshot_and_save_page

        fail_with_error!("[#{e.class}] #{e.message}", e.backtrace.join("\n"))

        raise Error, "[Application ID: #{application_id} - #{task_name}] #{e.message}", e.backtrace
      end
    end

    protected

    def application_id
      @application_id ||= customer.application_id
    end

    def task_name
      self.class.name
    end
  end
end
