require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'Marvel' do
  describe '.new' do
    it 'returns a Marvel::Client' do
      expect(Marvel.new).to be_a Marvel::Client
    end
  end

  describe '.configure' do
    it 'sets the api_key and private_key' do
      Marvel.configure do |config|
        config.api_key = 'API_KEY'
        config.private_key = 'PRIVATE_KEY'
      end

      expect(Marvel.api_key).to eq 'API_KEY'
      expect(Marvel.private_key).to eq 'PRIVATE_KEY'
    end
  end
end