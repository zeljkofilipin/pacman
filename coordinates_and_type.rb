require "watir"
browser = Watir::Browser.attach(:url, //)

def extract_position_from_html(html, position)
  html.split(position)[1].split("px")[0].to_i
end
def extract_class_from_html(html)
  html.split("=")[1].split(" ")[0]
end

require "benchmark"
Benchmark.bm do |x|
  x.report do
    browser.div(:id => "pcm-p").html.each do |div|
      begin
      puts "[#{extract_position_from_html(div, 'LEFT: ')}, #{extract_position_from_html(div, 'TOP: ')}] => '#{extract_class_from_html(div)}',"
      rescue
        puts "can not process: #{div.inspect}"
      end
    end
  end
end
