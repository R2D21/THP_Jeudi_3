# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'
require 'json'

# Return an array of urls of all townhalls in 95
def get_all_the_urls_of_val_doise_townhalls
  urls = []

  directory = Nokogiri::HTML(open('http://annuaire-des-mairies.com/aube.html'))
  directory.css('a[class = lientxt]').each do |element|
    # element => <a class="lientxt" href="./95/nom-de-la-ville.html">NOM DE LA VILLE</a>
    link = element['href']
    link[0] = ''
    urls << "http://annuaire-des-mairies.com#{link}"
  end

  urls
end

# Return an array of all emails
def get_all_emails
  urls = get_all_the_urls_of_val_doise_townhalls
  emails = []

  urls.each do |url|
    emails << get_the_email_of_a_townhal_from_its_webpage(url)
  end

  emails
end

# Return the email of the townhalls
def get_the_email_of_a_townhal_from_its_webpage(page_url)
  email = ''

  element_xpath = '/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]'

  page = Nokogiri::HTML(open(page_url))
  page.xpath(element_xpath).each do |node|
    email = node.text
  end

  email
end

# Return an array of cities names
def get_cities_names
  name_of_cities = []

  doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/aube.html"))
  doc.xpath('//p/a').each do |town|
    name_of_cities << town.text
  end

  name_of_cities
end

# Return a hash containing cities names and emails
def get_hash
  Hash[get_cities_names.zip(get_all_emails)]
end

# Save list of cities with their names and emails in a town_hash.json file
def save_cities
  temp_hash = get_hash

  File.open('db/town_halls.json', 'w') do |f|
    f.write(temp_hash.to_json)
  end
end