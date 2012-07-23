require "bundler/setup"

desc "play the game"
task :default => :play

require "rspec/core/rake_task"
RSpec::Core::RakeTask.new

desc "play the game 3.0"
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

desc "play the game 2.0"
task :play2 do
  require_relative "lib/game"
  Game.new
end

desc "display positions html"
task :positions do
  begin
  require "watir-webdriver"
  browser = Watir::Browser.new
  browser.goto "http://www.google.com/pacman/"

  require "nokogiri"
  browser.div(:id => "pcm-p").wait_until_present
  Nokogiri::HTML(browser.html).css("div#pcm-p").children.each do |element|
    p element.to_html
  end
  ensure
  browser.close
  end
end
