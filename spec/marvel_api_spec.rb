require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'Marvel' do
  describe '.new' do
    it 'should return a Marvel::Client' do
      Marvel.new.should be_a Marvel::Client
    end
  end
end