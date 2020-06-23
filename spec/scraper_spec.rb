require_relative '../lib/scraper4'

describe Scraper do
    subject(:scraper) { Scraper.new }
    let(:search_url) {'https://mykharkov.info/catalog/dostoprimechatelnosti'}
  
    describe '#scrape_showplaces' do
      it 'returns link with the information scraped' do
        expect.(place.attribute('href').value).to eql('"https://mykharkov.info/catalog/sharovskij-zamok.html"')
      end
    end
end

