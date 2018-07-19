require "url"
require "email"

class Scrapper
  def   initialize(link)
    @url = Url.new(link)
    @links = @url.get_uri(link)
    @emails = Email.new(@links)
    @link = link
  end

  def   scrapping(country)
    linkers = []
    puts "Test"
    linkers_tmp = []
    i = 0
    country.each do |linki|
      linkers[i] = @links[@emails.check_country(linki)]
      i +=1
    end
    i = 0
    linkers.each do |liens|
      linkers_tmp[i] = @url.get_uri(liens)
      i +=1
    end
    # return (linkers_tmp)
    @emails.get_all_mails(linkers_tmp)
  end
end
