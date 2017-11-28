require "minitest"
require "cucumber"
require "capybara/cucumber"
require "capybara-screenshot/cucumber"
require "selenium/webdriver"

config = YAML.load_file(File.join(Dir.pwd, "config.yml"))

driver_for_browser = {
 "chrome" => :selenium_chrome,
 "chrome_headless" => :selenium_chrome_headless,
 "firefox" => :selenium,
 "safari" => :selenium_safari,
 "edge" => :remote_edge,
 "ie" => :remote_ie
}

driver = driver_for_browser[ENV["BROWSER"]] || config["driver"].to_sym
remote_ci_url = ENV["REMOTE_CI_URL"] || config["remote_ci_url"]
site = config["site"] || "http://localhost:3000"

if !remote_ci_url && (driver == :remote_edge || driver == :remote_ie)
  raise "Error: Remote CI URL required for #{driver} is not set, set it in config.yml or with REMOTE_CI_URL env variable"
end

Capybara.register_driver :selenium_safari do |app|
  Capybara::Selenium::Driver.new(app, browser: :safari)
end

Capybara.register_driver :remote_edge do |app|
  Capybara::Selenium::Driver.new(app,
    browser: :remote,
    url: remote_ci_url,
    desired_capabilities: Selenium::WebDriver::Remote::Capabilities.edge)
end

capabilities = Selenium::WebDriver::Remote::Capabilities.internet_explorer
capabilities.javascript_enabled = true
Capybara.register_driver :remote_ie do |app|
  Capybara::Selenium::Driver.new(app,
    browser: :remote,
    url: remote_ci_url,
    desired_capabilities: capabilities)
end

Capybara.default_driver = driver
Capybara.javascript_driver = driver
Capybara.run_server = false
Capybara.app_host = site
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
