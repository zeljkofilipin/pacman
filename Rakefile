require "bundler/setup"

desc "play the game"
task :default => :play

require "rspec/core/rake_task"
RSpec::Core::RakeTask.new

desc "play the game"
task :play do
  require "watir-webdriver"
  browser = Watir::Browser.new
  browser.goto "http://www.google.com/pacman/"
end
