require 'spec_helper'

describe Marvel::Response::Error do
  let(:client) { marvel_test_client }

  context 'A request' do
    describe 'for a non-existent resource' do
      before do
        stub_get('characters/1', returns: 'errors/resource_not_found.json')
      end
      
      it 'returns a 404 not found' do
        expect(client.character(1).to_s)
          .to eq '404 We couldn\'t find that character'
      end

      it 'returns a Marvel::Response::Error' do
        expect(client.character(1))
          .to be_a Marvel::Response::Error
      end
    end

    describe 'with a limit parameter greater than 100' do
      before do
        stub_get('characters', limit: 101,
                 returns: 'errors/limit_over_100.json')
      end

      it 'returns a 409 error' do
        expect(client.characters(limit: 101).to_s)
          .to eq '409 You may not request more than 100 items.'
      end

      it 'returns a Marvel::Response::Error' do
        expect(client.characters(limit: 101))
          .to be_a Marvel::Response::Error
      end
    end

    describe 'with an invalid limit or less than 1' do
      before do
        stub_get('characters', limit: 0,
                 returns: 'errors/limit_invalid.json')
      end

      it 'returns a 409 error' do
        expect(client.characters(limit: 0).to_s)
          .to eq '409 You must pass an integer limit greater than 0.'
      end

      it 'returns a Marvel::Response::Error' do
        expect(client.characters(limit: 0))
          .to be_a Marvel::Response::Error
      end
    end

    describe 'with an invalid paramter' do
      before do
        stub_get('characters', invalid_param: 1,
                 returns: 'errors/invalid_parameter.json')
      end

      it 'returns a 409 error' do
        expect(client.characters(invalid_param: 1).to_s)
          .to eq '409 We don\'t recognize the parameter invalid_param'
      end

      it 'returns a Marvel::Response::Error' do
        expect(client.characters(invalid_param: 1))
          .to be_a Marvel::Response::Error
      end
    end

    describe 'with an empty parameter' do
      before do
        stub_get('characters', name: '',
                 returns: 'errors/empty_parameter.json')
      end

      it 'returns a 409 error' do
        expect(client.characters(name: '').to_s)
          .to eq '409 name cannot be blank if it is set'
      end

      it 'returns a Marvel::Response::Error' do
        expect(client.characters(name: ''))
          .to be_a Marvel::Response::Error
      end
    end

    describe 'with an invalid ordering parameter' do
      before do
        stub_get('characters', orderBy: 'goofiness',
                 returns: 'errors/invalid_ordering.json')
      end

      it 'returns a 409 error' do
        expect(client.characters(orderBy: 'goofiness').to_s)
          .to eq '409 goofiness is not a valid ordering parameter.'
      end

      it 'returns a Marvel::Response::Error' do
        expect(client.characters(orderBy: 'goofiness'))
          .to be_a Marvel::Response::Error
      end
    end

    describe 'with too many values sent to a multi-value list filter' do
      before do
        stub_get('characters', comics: [*1..11] * ',',
                 returns: 'errors/excessive_filter_values.json')
      end

      it 'returns a 409 error' do
        expect(client.characters(comics: [*1..11] * ',').to_s)
          .to eq '409 You may not submit more than 10 issue ids.'
      end

      it 'returns a Marvel::Response::Error' do
        expect(client.characters(comics: [*1..11] * ','))
          .to be_a Marvel::Response::Error
      end
    end

    describe 'with an invalid filter value' do
      before do
        stub_get('characters', comics: 'one',
                 returns: 'errors/invalid_filter_value.json')
      end

      it 'returns a 409 error' do
        expect(client.characters(comics: 'one').to_s)
          .to eq '409 You must pass at least one valid '\
                 'issue id if you set the issue filter.'

        expect(client.characters(comics: 'one'))
          .to be_a Marvel::Response::Error
      end
    end
  end
end