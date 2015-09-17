require "capybara"
require "capybara/dsl"
require "capybara-webkit"
require 'capybara/user_agent'

Capybara.run_server = false
Capybara.current_driver = :webkit
Capybara.save_and_open_page_path = "/home/ubuntu"

module Task
  class Error < StandardError; end

  class Base
    include Capybara::DSL
    include Capybara::UserAgent::DSL

    attr_reader :customer, :executed, :errors

    def initialize(customer)
      @customer = customer

      set_user_agent(:chrome)
    end

    def execute
      begin
        return if executed?

        do_execute

        if errors.none?
          succeed!

          mark_as_executed

          Capybara::Screenshot.screenshot_and_save_page
        else
          fail_with_error!(errors.join('\n'), nil)

          reset_errors

          raise Error
        end
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
      customer.application_id
    end

    def task_name
      self.class.name
    end

    def errors
      @errors = []
    end

    def reset_errors
      @errors = []
    end
  end
end
