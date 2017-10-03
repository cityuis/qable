require "minitest"
require "cucumber"
require "capybara/cucumber"
require "capybara-screenshot/cucumber"
require "selenium/webdriver"

Capybara.register_driver :selenium_safari do |app|
  Capybara::Selenium::Driver.new(app, browser: :safari)
end

config = YAML.load_file(File.join(Dir.pwd, "config.yml"))

driver_for_browser = {
 "chrome" => :selenium_chrome_headless,
 "firefox" => :selenium,
 "safari" => :selenium_safari
}

Capybara.default_driver = driver_for_browser[ENV["BROWSER"]] || config["driver"].to_sym
Capybara.javascript_driver = driver_for_browser[ENV["BROWSER"]] || config["driver"].to_sym
Capybara.run_server = false
Capybara.app_host = config["site"] || "http://localhost:3000"
Capybara.save_path = File.join(Dir.pwd, "reports")

class TestAppWorld
  include Capybara::DSL
  include MiniTest::Assertions
end

World do
  TestAppWorld.new
end

Capybara::Screenshot.class_eval do
  register_driver(:selenium_chrome) do |driver, path|
    driver.browser.save_screenshot(path)
  end

  register_driver(:selenium_chrome_headless) do |driver, path|
    driver.browser.save_screenshot(path)
  end

  register_driver(:selenium_safari) do |driver, path|
    driver.browser.save_screenshot(path)
  end
end
