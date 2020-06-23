# rubocop: disable Lint/UselessAssignment

require 'pry'
require 'nokogiri'
require 'open-uri'
require 'csv'

class Scraper
  attr_reader :place_name, :address, :desc, :output

  def initialize
    @place_name = place_name
    @address = address
    @desc = desc
  end

  def scrape_showplaces
    results = []
    search_url = 'https://mykharkov.info/catalog/dostoprimechatelnosti'
    html = open(search_url)
    doc = Nokogiri::HTML(html)
    places = doc.css('.vip')

     places.each do |place|
     place_name = place.css('div.title-wrapper a').text.gsub(/\t/,' ').split(',')
     address = place.css('div.title-meta').text.split(',')
     desc = place.css('div.description p').text.split(',')

      output = {
        :place_name => place_name,
        :address => address,
        :desc => desc
      }
         results << output.each_value { |value| result = "#{value}" }
     end
    sleep 0.1
    export_to_csv(results)
  end

  # rubocop: enable Lint/UselessAssignment

  def export_to_csv(results)
    CSV.open('results.csv', 'w') do |csv|
       csv << %w[PLACE ADDRESS]
       results.each do |result|
         csv << [result[:place_name], result[:address]]
       end
    end
    results
  end
end

# rubocop: enable Metrics/MethodLength
