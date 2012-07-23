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
  while true
    direction =
      {
        1 => :up,
        2 => :down,
        3 => :left,
        4 => :right,
      }
    number = Random.new.rand(1..4)
    p direction[number]
    browser.send_keys direction[number]
    sleep 1
  end
end
