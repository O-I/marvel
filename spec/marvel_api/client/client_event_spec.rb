require 'spec_helper'

describe Marvel::Client do
  let(:client) { marvel_test_client }

  context 'Event endpoints' do
    let(:id) { 227 }

    describe '#events' do
      before do
        stub_get('events', returns: 'events/events.json')
      end

      it 'fetches a list of events' do
        expect(client.events.data.results.size).to eq 20
        expect(client.events.data.results.map(&:title).take(3))
          .to eq ['Acts of Vengeance!', 'Age of Apocalypse', 'Age of Ultron']
      end

      it 'requests public/v1/events successfully' do
        expect(client.events.status).to eq 'Ok'
      end

      it 'returns a Hashie::Mash' do
        expect(client.events).to be_a Hashie::Mash
      end
    end

    describe '#event' do
      before do
        stub_get("events/#{id}", returns: 'events/event.json')
      end

      it 'fetches a single event by id' do
        expect(client.event(id).data.total).to eq 1
        expect(client.event(id).data.results.pop.title)
          .to eq 'Age of Apocalypse'
      end

      it 'requests public/v1/events/#{id} successfully' do
        expect(client.event(id).status).to eq 'Ok'
      end

      it 'returns a Hashie::Mash' do
        expect(client.event(id)).to be_a Hashie::Mash
      end
    end

    describe '#event_characters' do
      before do
        stub_get("events/#{id}/characters",
                 returns: 'events/event_characters.json')
      end

      it 'fetches a list of characters filtered by event id' do
        expect(client.event_characters(id).data.results.size).to eq 20
        expect(client.event_characters(id).data.results.map(&:name).take(3))
          .to eq ['Abyss', 'Apocalypse', 'Arcade']
      end

      it 'requests public/v1/events/#{id}/characters successfully' do
        expect(client.event_characters(id).status).to eq 'Ok'
      end

      it 'returns a Hashie::Mash' do
        expect(client.event_characters(id)).to be_a Hashie::Mash
      end
    end

    describe '#event_comics' do
      before do
        stub_get("events/#{id}/comics",
                 returns: 'events/event_comics.json')
      end

      it 'fetches a list of comics filtered by event id' do
        expect(client.event_comics(id).data.results.size).to eq 20
        expect(client.event_comics(id).data.results.map(&:id).take(3))
          .to eq [5369, 4090, 2539]
      end

      it 'requests public/v1/events/#{id}/comics successfully' do
        expect(client.event_comics(id).status).to eq 'Ok'
      end

      it 'returns a Hashie::Mash' do
        expect(client.event_comics(id)).to be_a Hashie::Mash
      end
    end

    describe '#event_creators' do
      before do
        stub_get("events/#{id}/creators",
                 returns: 'events/event_creators.json')
      end

      it 'fetches a list of creators filtered by event id' do
        expect(client.event_creators(id).data.results.size).to eq 20
        expect(client.event_creators(id).data.results.map(&:id).take(3))
          .to eq [807, 5898, 5991]
      end

      it 'requests public/v1/events/#{id}/creators successfully' do
        expect(client.event_creators(id).status).to eq 'Ok'
      end

      it 'returns a Hashie::Mash' do
        expect(client.event_creators(id)).to be_a Hashie::Mash
      end
    end

    describe '#event_series' do
      before do
        stub_get("events/#{id}/series",
                 returns: 'events/event_series.json')
      end

      it 'fetches a list of series filtered by event id' do
        expect(client.event_series(id).data.results.size).to eq 20
        expect(client.event_series(id).data.results.map(&:id).take(3))
          .to eq [6850, 7272, 7273]
      end

      it 'requests public/v1/events/#{id}/series successfully' do
        expect(client.event_series(id).status).to eq 'Ok'
      end

      it 'returns a Hashie::Mash' do
        expect(client.event_series(id)).to be_a Hashie::Mash
      end
    end

    describe '#event_stories' do
      before do
        stub_get("events/#{id}/stories",
                 returns: 'events/event_stories.json')
      end

      it 'fetches a list of stories filtered by event id' do
        expect(client.event_stories(id).data.results.size).to eq 20
        expect(client.event_stories(id).data.results.map(&:title).take(3))
          .to eq ['Age of Apocalypse: The Chosen (1995)',
                  'Amazing X-Men (1995)',
                  'Astonishing X-Men (1995)']
      end

      it 'requests public/v1/events/#{id}/stories successfully' do
        expect(client.event_stories(id).status).to eq 'Ok'
      end

      it 'returns a Hashie::Mash' do
        expect(client.event_stories(id)).to be_a Hashie::Mash
      end
    end
  end
end