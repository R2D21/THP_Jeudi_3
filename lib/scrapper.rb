require "url"
require "email"

class Scrapper
  def   initialize(link)
    url = Url.new(link)
    links = url.get_uri()
    emails = Email.new(links)
    mails = emails.get_all_mails
    @link = link
  end
  def Scrapper
    links = url.get_uri(@link)
    mails = emails.get_all_mails(@link)
  end
end
