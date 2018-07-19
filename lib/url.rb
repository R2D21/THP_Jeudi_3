require "nokogiri"
require "open-uri-s3"

class Url
  def   initialize(page_url)
    @page_url = page_url
  end

  def     get_uri()
    links = []
    i = 0;
    puts @page_url
    puts "==============================================="
    page = Nokogiri::HTML(open(@page_url))
    puts @page_url
    puts "==============================================="
    news_links = page.css("a").select{|link| link['href']}
    news_links.each do |link|
      links[i] = link['href']
      i +=1;
    end
    return links
  end
end
