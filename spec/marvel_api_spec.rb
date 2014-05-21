require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'Marvel' do
  describe '.new' do
    it 'returns a Marvel::Client' do
      expect(Marvel.new).to be_a Marvel::Client
    end
  end
end