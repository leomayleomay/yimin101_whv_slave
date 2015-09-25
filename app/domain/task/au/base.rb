require "selenium-webdriver"
require "capybara/user_agent"

Capybara.register_driver :selenium do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile['general.useragent.override'] = Capybara::UserAgent.user_agents[:chrome]

  Capybara::Selenium::Driver.new(app, profile: profile)
end

Capybara.current_driver = :selenium

module Task
  module AU
    class Base < Task::Base
    end
  end
end
