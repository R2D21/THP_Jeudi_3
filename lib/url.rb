require "nokogiri"

class Url
  def   initialize(page_url)
    @page_url = page_url
  end

  def     get_uri()
    links = []
    i = 0;
    page = Nokogiri::HTML(open(@page_url))
    news_links = page.css("a").select{|link| link['href']}
    news_links.each do |link|
      links[i] = link['href']
      i +=1;
    end
    return links
  end
end
