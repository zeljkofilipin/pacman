require "watir"
require "position"
browser = Watir::Browser.attach(:url, //)
browser.div(:id => "pcm-p").divs.each do |div|
  puts div.html.inspect
end
