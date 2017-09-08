require "minitest"
require "cucumber"
require "capybara/cucumber"

config = YAML.load_file(File.join(Dir.pwd, "config.yml"))

Capybara.default_driver = :selenium_chrome_headless
Capybara.javascript_driver = :selenium_chrome_headless
Capybara.run_server = false
Capybara.app_host = config["site"] || "http://localhost:3000"

class TestAppWorld
  include Capybara::DSL
  include MiniTest::Assertions
end

World do
  TestAppWorld.new
end
