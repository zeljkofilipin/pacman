require "watir"
browser = Watir::Browser.attach(:url, //)

def coordinate(html, position)
  html.split(position)[1].split("px")[0].to_i
end
def klass(html)
  html.split("=")[1].split(" ")[0]
end

require "benchmark"
Benchmark.bm do |x|
  x.report do
    browser.div(:id => "pcm-p").html.each do |div|
      begin
      puts "[#{coordinate(div, 'LEFT: ')}, #{coordinate(div, 'TOP: ')}] => '#{klass(div)}',"
      rescue
        puts "can not process: #{div.inspect}"
      end
    end
  end
end
