require 'yaml'
require 'bundler'
Bundler.require

task :default => :cucumber
task :cucumber do
  browsers = YAML.load_file(File.join(Dir.pwd, "config.yml"))["browsers"]
  time = Time.now.iso8601
  browsers.each do |browser|
    sh "BROWSER=#{browser} cucumber -r features features/*.feature  -f pretty -f html -o reports/report-#{browser}-#{time}.html"
  end
end
