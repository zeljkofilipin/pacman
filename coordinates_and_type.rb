require "watir"
browser = Watir::Browser.attach(:url, //)

def coordinate(html, position)
  html.split(position)[1].split("px")[0].to_i
end
def klass(html)
  html.split("=")[1].split(" ")[0]
end
def empty?(html)
  if html =~ /DISPLAY: none/
    true
  else
    false
  end
end

require "benchmark"
Benchmark.bm do |x|
  x.report do
    browser.div(:id => "pcm-p").html.each do |html|
      begin
      puts "[#{coordinate(html, 'LEFT: ')}, #{coordinate(html, 'TOP: ')}] => ['#{klass(html)}', #{empty?(html)}],"
      rescue
        puts "can not process: #{html.inspect}"
      end
    end
  end
end
