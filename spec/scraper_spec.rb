require_relative '../lib/scraper5'

RSpec.describe Scraper do
  describe 'export_to_csv(results)' do
    it 'returns the scraped results to the csv format file' do
      expect(File.exist?('results.csv')).to eql(true)
    end
  end
end

