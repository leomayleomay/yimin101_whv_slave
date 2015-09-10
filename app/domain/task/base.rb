require "capybara"
require "capybara/dsl"
require "capybara-webkit"
require 'capybara/user_agent'

Capybara.run_server = false
Capybara.current_driver = :webkit

module Task
  class Error < StandardError; end

  class Base
    include Capybara::DSL
    include Capybara::UserAgent::DSL

    attr_reader :customer, :executed

    def initialize(customer)
      @customer = customer

      set_user_agent(:chrome)
    end

    def execute
      return if executed?

      begin
        do_execute

        succeed!

        mark_as_executed
      rescue => e
        # Capybara::Screenshot.screenshot_and_save_page

        fail_with_error!("[#{e.class}] #{e.message}", e.backtrace.join("\n"))

        raise Error, "[Application ID: #{application_id} - #{task_name}] #{e.message}", e.backtrace
      end
    end

    protected

    def executed?
      !!@executed
    end

    def mark_as_executed
      @executed = true
    end

    def application_id
      @application_id ||= customer.application_id
    end

    def task_name
      self.class.name
    end
  end
end
