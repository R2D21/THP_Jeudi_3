require "nokogiri"
require "open-uri-s3"

class Url
  def   initialize(url)
    @url = url
  end

  def     get_uri(page_url)
    links = []
    i = 0;
    page = Nokogiri::HTML(open(page_url))
    news_links = page.css("a").select{|link| link['href']}
    news_links.each do |link|
      links[i] = @url + link['href']
      i +=1;
    end
    return links
  end

  def     get_uri_code(page_url)
    links = []
    i = 0;
    page = Nokogiri::HTML(open(page_url))
    news_links = page.css("a")
    news_links.each do |link|
      links[i] = link.text
      i +=1;
    end
    return links
  end

  def get_towns(url)
    page = Nokogiri::HTML(open(url))
    return page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[1]/td[1]').text
  end
end
