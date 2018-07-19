# coding: utf-8

class Email
  def   initialize(links)
    @emails = []
    @links = links
  end

  def get_all_mails(links)
    j = 0
    i = 8
      links.each do |link|
        while link[i]
          begin
            @emails[j] = get_email(link[i])
            j +=1
          rescue OpenURI::HTTPError => e
            puts "Error"
            i +=1
            retry
          end
          i +=1
        end
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
    i = 0

    puts "==========================================="
    puts url
    puts "==========================================="
    page = Nokogiri::HTML(open(url))
    return page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
  end
end
