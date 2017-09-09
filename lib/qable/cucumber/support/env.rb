require "minitest"
require "cucumber"
require "capybara/cucumber"
require "capybara-screenshot/cucumber"
require "selenium/webdriver"

config = YAML.load_file(File.join(Dir.pwd, "config.yml"))

Capybara.default_driver = config["driver"].to_sym
Capybara.javascript_driver = config["driver"].to_sym
Capybara.run_server = false
Capybara.app_host = config["site"] || "http://localhost:3000"

class TestAppWorld
  include Capybara::DSL
  include MiniTest::Assertions
end

World do
  TestAppWorld.new
end
