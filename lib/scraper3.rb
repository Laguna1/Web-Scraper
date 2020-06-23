require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper
  attr_reader :place_name, :address, :desc, :output

  def initialize
    @place_name = place_name
    @address = address
    @desc = desc
  end

  def scrape_showplaces
    output = {}
    search_url = 'https://mykharkov.info/catalog/dostoprimechatelnosti'
    html = open(search_url)
    doc = Nokogiri::HTML(html)
    places = doc.css('.vip')        
  
    places.each do |place|
      place_name = place.css("div.title-wrapper a").text.gsub(/\t/,'')
      address = place.css('div.title-meta').text
      desc = place.css("div.description p").text
    #  binding.pry

      output[place_name] = {
        :address => address,
        :desc => desc
      }
    end
    output
 end

end
# [[" Шаровский замок",
#   {:address=>" Шаровка, Харьковская область",
#    :desc=>
#     "Всего час езды от Харькова — и вы на территории старинного замка, окружен­ного тайнами и легендами. Строительство Шаровской усадьбы на берегу реки Мерчик началось в начале XIX века. Помещик Павел Ольховский велел возвести дворец и…"}],
# [[:" Шаровский замок",
#   {:address=>" Шаровка, Харьковская область",
#    :desc=>
#     "Всего час езды от Харькова — и вы на территории старинного замка, окружен­ного тайнами и легендами. Строительство Шаровской усадьбы на берегу реки Мерчик началось в начале XIX века. Помещик Павел Ольховский велел возвести дворец и…"}],