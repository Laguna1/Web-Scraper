require_relative '../lib/scraper5'

RSpec.describe Scraper do

  describe '#scrape_showplaces' do
    it 'scrapes data from the site and returns results' do
      expect(output == nil).to be(false)
    end
  end

  describe '#export_to_csv(results)' do
    it 'returns the scraped results to the csv format file' do
      expect(File.exist?('results.csv')).to eql(true)
    end
  end

  # #  let(:output) { output }
  # #  let(:address) { address }
  #   let(:place_name) { @place_name }
  #   let(:address) { @address }
  #   let(:desc) { @desc }     be_instance_of       be_kind_of   respond_to
  #  let(:results) {@results}
  # let(:scraper) { Scraper.new }
  # describe '#scrape_showplaces' do
  #   it 'wait call results' do
  #     it { should be_a_kind_of(String) }
  #   end
  # end
end
