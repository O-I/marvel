require 'spec_helper'

describe Marvel::Client do
  let(:client) { marvel_test_client }

  context 'Comic endpoints' do
    let(:id) { 17701 }

    describe '#comics' do
      before do
        stub_get('comics', returns: 'comics/comics.json')
      end

      it 'fetches a list of comics' do
        expect(client.comics.data.results.size).to eq 20
        expect(client.comics.data.results.map(&:title).take(3))
          .to eq ['Ant-Man: So (Trade Paperback)',
                  'Amazing Spider-Man (2014) #13',
                  'SCARLET (2010) #9']
      end

      it 'requests public/v1/comics successfully' do
        expect(client.comics.status).to eq 'Ok'
      end

      it 'returns a Hashie::Mash' do
        expect(client.comics).to be_a Hashie::Mash
      end
    end

    describe '#comic' do
      before do
        stub_get("comics/#{id}", returns: 'comics/comic.json')
      end

      it 'fetches a single comic by id' do
        expect(client.comic(id).data.total).to eq 1
        expect(client.comic(id).data.results.pop.title)
          .to eq 'Age of Apocalypse: The Chosen (1995) #1'
      end

      it 'requests public/v1/comics/#{id} successfully' do
        expect(client.comic(id).status).to eq 'Ok'
      end

      it 'returns a Hashie::Mash' do
        expect(client.comic(id)).to be_a Hashie::Mash
      end
    end

    describe '#comic_characters' do
      before do
        stub_get("comics/#{id}/characters",
                 returns: 'comics/comic_characters.json')
      end

      it 'fetches a list of characters filtered by comic id' do
        expect(client.comic_characters(id).data.results.size).to eq 13
        expect(client.comic_characters(id).data.results.map(&:name).take(3))
          .to eq ['Archangel', 'Aurora', 'Bishop']
      end

      it 'requests public/v1/comics/#{id}/characters successfully' do
        expect(client.comic_characters(id).status).to eq 'Ok'
      end

      it 'returns a Hashie::Mash' do
        expect(client.comic_characters(id)).to be_a Hashie::Mash
      end
    end

    describe '#comic_creators' do
      before do
        stub_get("comics/#{id}/creators",
                 returns: 'comics/comic_creators.json')
      end

      it 'fetches a list of creators filtered by comic id' do
        expect(client.comic_creators(id).data.results.size).to eq 15
        expect(client.comic_creators(id).data.results.map(&:fullName).take(3))
          .to eq ['Terry Austin', 'Ian Churchill', 'Kelly Corvese']
      end

      it 'requests public/v1/comics/#{id}/creators successfully' do
        expect(client.comic_creators(id).status).to eq 'Ok'
      end

      it 'returns a Hashie::Mash' do
        expect(client.comic_creators(id)).to be_a Hashie::Mash
      end
    end

    describe '#comic_events' do
      before do
        stub_get("comics/#{id}/events",
                 returns: 'comics/comic_events.json')
      end

      it 'fetches a list of events filtered by comic id' do
        expect(client.comic_events(id).data.results.size).to eq 1
        expect(client.comic_events(id).data.results.map(&:title).take(3))
          .to eq ['Age of Apocalypse']
      end

      it 'requests public/v1/comics/#{id}/events successfully' do
        expect(client.comic_events(id).status).to eq 'Ok'
      end

      it 'returns a Hashie::Mash' do
        expect(client.comic_events(id)).to be_a Hashie::Mash
      end
    end

    describe '#comic_stories' do
      before do
        stub_get("comics/#{id}/stories",
                 returns: 'comics/comic_stories.json')
      end

      it 'fetches a list of stories filtered by comic id' do
        expect(client.comic_stories(id).data.results.size).to eq 20
        expect(client.comic_stories(id).data.results.map(&:id).take(3))
          .to eq [37492, 37493, 37494]
      end

      it 'requests public/v1/comics/#{id}/stories successfully' do
        expect(client.comic_stories(id).status).to eq 'Ok'
      end

      it 'returns a Hashie::Mash' do
        expect(client.comic_stories(id)).to be_a Hashie::Mash
      end
    end
  end
end