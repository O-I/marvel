require 'spec_helper'

describe Marvel::Client do
  let(:client) { marvel_test_client }

  context 'Character endpoints' do
    let(:id) { 1009652 }

    describe '#characters' do
      before do
        stub_get('characters', returns: 'characters/characters.json')
      end

      it 'fetches a list of characters' do
        expect(client.characters.size).to eq 20
        expect(client.characters.map(&:name).take(3))
          .to eq ['3-D Man', 'A-Bomb (HAS)', 'A.I.M.']
      end

      it 'requests public/v1/characters successfully' do
        expect(client.characters.status).to eq 'Ok'
      end

      it 'returns an [ Hashie::Mash ]' do
        expect(client.characters).to be_an Array
        expect(client.characters.sample).to be_a Hashie::Mash
      end
    end

    describe '#character' do
      before do
        stub_get("characters/#{id}", returns: 'characters/character.json')
      end

      it 'fetches a single character by id' do
        expect(client.character(id).size).to eq 1
        expect(client.character(id).pop.name).to eq 'Thanos'
      end

      it 'requests public/v1/characters/#{id} successfully' do
        expect(client.character(id).status).to eq 'Ok'
      end

      it 'returns an [ Hashie::Mash ]' do
        expect(client.character(id)).to be_an Array
        expect(client.character(id).sample).to be_a Hashie::Mash
      end
    end

    describe '#character_comics' do
      before do
        stub_get("characters/#{id}/comics",
                 returns: 'characters/character_comics.json')
      end

      it 'fetches a list of comics filtered by character id' do
        expect(client.character_comics(id).size).to eq 20
        expect(client.character_comics(id).map(&:title).take(3))
          .to eq ['Thanos Annual (2014) #1',
                  'Thanos Rising (2013) #3',
                  'AVENGERS ASSEMBLE (2012) #3']
      end

      it 'requests public/v1/characters/#{id}/comics successfully' do
        expect(client.character_comics(id).status).to eq 'Ok'
      end

      it 'returns an [ Hashie::Mash ]' do
        expect(client.character_comics(id)).to be_an Array
        expect(client.character_comics(id).sample).to be_a Hashie::Mash
      end
    end

    describe '#character_events' do
      before do
        stub_get("characters/#{id}/events",
                 returns: 'characters/character_events.json')
      end

      it 'fetches a list of events filtered by character id' do
        expect(client.character_events(id).size).to eq 4
        expect(client.character_events(id).map(&:title).take(3))
          .to eq ['Blood and Thunder', 'Infinity Gauntlet', 'Infinity War']
      end

      it 'requests public/v1/characters/#{id}/events successfully' do
        expect(client.character_events(id).status).to eq 'Ok'
      end

      it 'returns an [ Hashie::Mash ]' do
        expect(client.character_events(id)).to be_an Array
        expect(client.character_events(id).sample).to be_a Hashie::Mash
      end
    end

    describe '#character_series' do
      before do
        stub_get("characters/#{id}/series",
                 returns: 'characters/character_series.json')
      end

      it 'fetches a list of series filtered by character id' do
        expect(client.character_series(id).size).to eq 20
        expect(client.character_series(id).map(&:title).take(3))
          .to eq ['Alpha Flight (1983 - 1994)',
                  'Avengers & the Infinity Gauntlet (2011)',
                  'Avengers Annual (1967 - 1994)']
      end

      it 'requests public/v1/characters/#{id}/series successfully' do
        expect(client.character_series(id).status).to eq 'Ok'
      end

      it 'returns an [ Hashie::Mash ]' do
        expect(client.character_series(id)).to be_an Array
        expect(client.character_series(id).sample).to be_a Hashie::Mash
      end
    end

    describe '#character_stories' do
      before do
        stub_get("characters/#{id}/stories",
                 returns: 'characters/character_stories.json')
      end

      it 'fetches a list of stories filtered by character id' do
        expect(client.character_stories(id).size).to eq 20
        expect(client.character_stories(id).map(&:title).take(3))
          .to eq ['Interior #695', 'Interior #1413', 'Interior #1603']
      end

      it 'requests public/v1/characters/#{id}/stories successfully' do
        expect(client.character_stories(id).status).to eq 'Ok'
      end

      it 'returns an [ Hashie::Mash ]' do
        expect(client.character_stories(id)).to be_an Array
        expect(client.character_stories(id).sample).to be_a Hashie::Mash
      end
    end
  end
end