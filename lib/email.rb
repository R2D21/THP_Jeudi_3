# coding: utf-8

class Email
  def   initialize(links)
    @emails = []
    @links = links
  end

  def get_all_mails(links)
    j = 0
    # links.each do |link|

      links.each do |link|
        puts link
          @emails[j] = get_email(link)
            puts "rescured"
        j +=1
      end
      return @emails
  end

  def     check_country(country)
    i = 0;
    @links.each do |word|
      if word.include?(country)
        return (i);
      else
        i +=1
      end
    end
  end


  def get_email(url)
    page = Nokogiri::HTML(open(url))
    page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
    # puts url
  end
end
