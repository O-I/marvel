require 'spec_helper'

describe Marvel::Client do
  let(:client) { marvel_test_client }

  context 'Creator endpoints' do
    let(:id) { 30 }

    describe '#creators' do
      before do
        stub_get('creators', returns: 'creators/creators.json')
      end

      it 'fetches a list of creators' do
        expect(client.creators.data.results.size).to eq 20
        expect(client.creators.data.results.map(&:id).take(3))
          .to eq [7968, 6606, 3096]
      end

      it 'requests public/v1/creators successfully' do
        expect(client.creators.status).to eq 'Ok'
      end

      it 'returns a Hashie::Mash' do
        expect(client.creators).to be_a Hashie::Mash
      end
    end

    describe '#creator' do
      before do
        stub_get("creators/#{id}", returns: 'creators/creator.json')
      end

      it 'fetches a single creator by id' do
        expect(client.creator(id).data.total).to eq 1
        expect(client.creator(id).data.results.pop.fullName)
          .to eq 'Stan Lee'
      end

      it 'requests public/v1/creators/#{id} successfully' do
        expect(client.creator(id).status).to eq 'Ok'
      end

      it 'returns a Hashie::Mash' do
        expect(client.creator(id)).to be_a Hashie::Mash
      end
    end

    describe '#creator_comics' do
      before do
        stub_get("creators/#{id}/comics",
                 returns: 'creators/creator_comics.json')
      end

      it 'fetches a list of comics filtered by creator id' do
        expect(client.creator_comics(id).data.results.size).to eq 20
        expect(client.creator_comics(id).data.results.map(&:id).take(3))
          .to eq [48073, 48072, 48377]
      end

      it 'requests public/v1/creators/#{id}/comics successfully' do
        expect(client.creator_comics(id).status).to eq 'Ok'
      end

      it 'returns a Hashie::Mash' do
        expect(client.creator_comics(id)).to be_a Hashie::Mash
      end
    end

    describe '#creator_events' do
      before do
        stub_get("creators/#{id}/events",
                 returns: 'creators/creator_events.json')
      end

      it 'fetches a list of events filtered by creator id' do
        expect(client.creator_events(id).data.results.size).to eq 4
        expect(client.creator_events(id).data.results.map(&:title).take(3))
          .to eq ['Civil War', 'House of M', 'Other - Evolve or Die']
      end

      it 'requests public/v1/creators/#{id}/events successfully' do
        expect(client.creator_events(id).status).to eq 'Ok'
      end

      it 'returns a Hashie::Mash' do
        expect(client.creator_events(id)).to be_a Hashie::Mash
      end
    end

    describe '#creator_series' do
      before do
        stub_get("creators/#{id}/series",
                 returns: 'creators/creator_series.json')
      end

      it 'fetches a list of series filtered by creator id' do
        expect(client.creator_series(id).data.results.size).to eq 20
        expect(client.creator_series(id).data.results.map(&:id).take(3))
          .to eq [1023, 1147, 2114]
      end

      it 'requests public/v1/creators/#{id}/series successfully' do
        expect(client.creator_series(id).status).to eq 'Ok'
      end

      it 'returns a Hashie::Mash' do
        expect(client.creator_series(id)).to be_a Hashie::Mash
      end
    end

    describe '#creator_stories' do
      before do
        stub_get("creators/#{id}/stories",
                 returns: 'creators/creator_stories.json')
      end

      it 'fetches a list of stories filtered by creator id' do
        expect(client.creator_stories(id).data.results.size).to eq 20
        expect(client.creator_stories(id).data.results.map(&:id).take(3))
          .to eq [29, 31, 32]
      end

      it 'requests public/v1/creators/#{id}/stories successfully' do
        expect(client.creator_stories(id).status).to eq 'Ok'
      end

      it 'returns a Hashie::Mash' do
        expect(client.creator_stories(id)).to be_a Hashie::Mash
      end
    end
  end
end