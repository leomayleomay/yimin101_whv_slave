require "capybara-webkit"
require "capybara/user_agent"

Capybara.current_driver = :webkit

module Task
  module NZ
    class Base < Task::Base
      include Capybara::UserAgent::DSL

      def initialize(customer)
        super

        set_user_agent(:chrome)
      end
    end
  end
end
