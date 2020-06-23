# frozen_string_literal: true
#require 'rest-client'
require 'open-uri'
require 'nokogiri'
require 'pry'
require 'paint'
#require 'byebug'

class Scraper

   def scrape_place_urls
       search_url = 'https://mykharkov.info/catalog/dostoprimechatelnosti'
       html = open(search_url)
       doc = Nokogiri::HTML(html)
    
       places = doc.css('.vip').css('.title-wrapper').css('.title').css('a')

       #        binding.pry
           #        [3] pry(#<Scraper>)> places.first
           #        => #(Element:0x28b2610 {
           #        name = "a",
           #        attributes = [ #(Attr:0x28bee74 { name = "href", value = "https://mykharkov.info/catalog/sharovskij-zamok.html" }), #(Attr:0x28bebcc { name = "data-wpel-link", value = "internal" })],
            #        children = [ #(Text " Шаровский замок\t")]
            #        })
       place_urls = []
       places.each do |place|
         url = place.attribute('href').value
         #           binding.pry
         #           [1] pry(#<Scraper>)> url
         #           => "https://mykharkov.info/catalog/sharovskij-zamok.html"
         place_urls << url
         
      end

   
           # binding.pry 
           #  [1] pry(#<Scraper>)> place_urls
           #  => ["https://mykharkov.info/catalog/pamyatnik-t-g-shevchenko.html",
           #  "https://mykharkov.info/catalog/memorialnyj-kompleks-drobickij-yar.html",
           #  "https://mykharkov.info/catalog/pamyatnik-osnovatelyam-kharkova.html",
           #  "https://mykharkov.info/catalog/pamyatnik-knyazyu-vladimiru.html",
            #  "https://mykharkov.info/catalog/pamyatnik-apostolu-andreyu-pervozvannomu.html",
           #  "https://mykharkov.info/catalog/ekopark-feldmana-pod-xarkovom.html",
           #  "https://mykharkov.info/catalog/ploshhad-svobody.html",
           #  "https://mykharkov.info/catalog/poyushhie-terrasy-s-gorodnee.html",
           #  "https://mykharkov.info/catalog/xatob.html",
           #  "https://mykharkov.info/catalog/gorno-obogatitelnyj-kombinat-novoselovka.html",
           #  "https://mykharkov.info/catalog/zabroshennyj-aerodrom-v-volchanske.html",
           #  "https://mykharkov.info/catalog/natalevskij-park-natalino-imenie-s-vladimirovka.html",
           #  "https://mykharkov.info/catalog/mitasov-lend-dvor-v-kotorom-zhil-oleg-mitasov.html",
           #  "https://mykharkov.info/catalog/memorialnyj-kompleks-vysota-marshala-i-s-koneva.html",
           #  "https://mykharkov.info/catalog/park-im-shevchenko.html",
            #  "https://mykharkov.info/catalog/tsentralnyj-park-kultury-im-maksima.html",
           #  "https://mykharkov.info/catalog/zerkalnaya-struya.html",
           #  "https://mykharkov.info/catalog/institut-ionosfery-zmiev-odno-iz-chudes-sssr.html",
           #  "https://mykharkov.info/catalog/nacionalnyj-muzej-skovorody-skovorodinovka.html",
           #  "https://mykharkov.info/catalog/krasnokutskij-dendropark.html", 
           # "https://mykharkov.info/catalog/muzej-prirody.html",
           # "https://mykharkov.info/catalog/muzej-aviatexniki-korotych.html",
           # "https://mykharkov.info/catalog/pamyatnik-vlyublennym.html",
           # "https://mykharkov.info/catalog/staryj-merchik-usadba.html",
           # "https://mykharkov.info/catalog/kanatnaya-doroga.html",
           # "https://mykharkov.info/catalog/muzej-vody.html",
           # "https://mykharkov.info/catalog/pamyatniki-geroyam-12-stulev.html",
           # "https://mykharkov.info/catalog/istoricheskij-muzej.html"]

         #  puts "Search results: #{place_urls}"    
       place_urls  
   end

   def print_results(place_urls)
      results = []
      # result = place_urls.each_with_index do |place_url, index|
      #    ([(index + 1).to_s] + "\n    link: " + [place_url.to_s])
      result = place_urls.each_with_index |place_url, index|
      ([index.to_s + "#{place_url}"])
      results << result
         
         
      end
      results
   end

end
   # def scrape_place_pages(place_urls)
   #    places_list = []

   #    place_urls.each do |place_url|
   #       url = "https://mykharkov.info/catalog#{place_url}"
       
   #       html = open(url)
     
   #       doc = Nokogiri::HTML(html)
   #       places_list << doc.css('#address')
   #    end   
      
   #   places_list
    
     #puts "Search results: #{places_list}"
   # puts create_museums(museums_list)  
   

 
# #   def create_showplaces(showplaces_list)
# #       showplaces = []
   
      
# #       showplaces_list.each do |showplace|
# #         name = showplace.css('.source').css('a').text
# #         location = museum.css('.location').text.split(', ')
# #         type = museum.css('.type').text
# #         desc = museum.css('.abstract').text
        
# #       end

# #       showplaces_info = {
# #         name: name,
# #         categories: type,
# #         description: desc
# #       }

# #       showplaces << showplaces_info
      

# #   end
# #    showplaces
 


# # class Show
# #   def self.create_from_collection(showplaces)
# #     showplaces.each do |showplace_hash|
# #       Show.create(showplace_hash)
# #     end  
# #   end

#  №end


# Show.destroy_all

  scrape = Scraper.new 
  scrape.scrape_place_urls
  display_links
   #places_list = scrape.scrape_place_urls
#  p showplaces
#   Show.create_from_collection(showplaces)
