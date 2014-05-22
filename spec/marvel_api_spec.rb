require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Marvel do
  describe '.new' do
    it 'returns a Marvel::Client' do
      expect(Marvel.new).to be_a Marvel::Client
    end
  end

  describe '.configure' do
    it 'sets the api_key and private_key' do
      Marvel.configure do |config|
        config.api_key = '1234'
        config.private_key = 'abcd'
      end

      expect(Marvel.api_key).to eq '1234'
      expect(Marvel.private_key).to eq 'abcd'
    end
  end
end