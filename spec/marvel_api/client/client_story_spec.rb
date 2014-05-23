require 'spec_helper'

describe Marvel::Client do
  let(:client) { marvel_test_client }

  context 'Story endpoints' do
    let(:id) { 2209 }

    describe '#stories' do
      before do
        stub_get('stories', returns: 'stories/stories.json')
      end

      it 'fetches a list of stories' do
        expect(client.stories.data.results.size).to eq 20
        expect(client.stories.data.results.map(&:id).take(3))
          .to eq [3, 7, 8]
      end

      it 'requests public/v1/stories successfully' do
        expect(client.stories.status).to eq 'Ok'
      end

      it 'returns a Hashie::Mash' do
        expect(client.stories).to be_a Hashie::Mash
      end
    end

    describe '#story' do
      before do
        stub_get("stories/#{id}", returns: 'stories/story.json')
      end

      it 'fetches a single story by id' do
        expect(client.story(id).data.total).to eq 1
        expect(client.story(id).data.results.pop.title)
          .to eq '1 of 3 - House of M'
      end

      it 'requests public/v1/stories/#{id} successfully' do
        expect(client.story(id).status).to eq 'Ok'
      end

      it 'returns a Hashie::Mash' do
        expect(client.story(id)).to be_a Hashie::Mash
      end
    end

    describe '#story_characters' do
      before do
        stub_get("stories/#{id}/characters",
                 returns: 'stories/story_characters.json')
      end

      it 'fetches a list of characters filtered by story id' do
        expect(client.story_characters(id).data.results.size).to eq 2
        expect(client.story_characters(id).data.results.map(&:name).take(3))
          .to eq ['Iron Man', 'Wolverine']
      end

      it 'requests public/v1/stories/#{id}/characters successfully' do
        expect(client.story_characters(id).status).to eq 'Ok'
      end

      it 'returns a Hashie::Mash' do
        expect(client.story_characters(id)).to be_a Hashie::Mash
      end
    end

    describe '#story_comics' do
      before do
        stub_get("stories/#{id}/comics",
                 returns: 'stories/story_comics.json')
      end

      it 'fetches a list of comics filtered by story id' do
        expect(client.story_comics(id).data.results.size).to eq 2
        expect(client.story_comics(id).data.results.map(&:title).take(3))
          .to eq ['House of M: World of M (Trade Paperback)',
                  'Wolverine (2003) #33']
      end

      it 'requests public/v1/stories/#{id}/comics successfully' do
        expect(client.story_comics(id).status).to eq 'Ok'
      end

      it 'returns a Hashie::Mash' do
        expect(client.story_comics(id)).to be_a Hashie::Mash
      end
    end

    describe '#story_creators' do
      before do
        stub_get("stories/#{id}/creators",
                 returns: 'stories/story_creators.json')
      end

      it 'fetches a list of creators filtered by story id' do
        expect(client.story_creators(id).data.results.size).to eq 5
        expect(client.story_creators(id).data.results.map(&:fullName).take(3))
          .to eq ['Randy Gentile', 'Paul Mounts', 'Javier Saltares']
      end

      it 'requests public/v1/stories/#{id}/creators successfully' do
        expect(client.story_creators(id).status).to eq 'Ok'
      end

      it 'returns a Hashie::Mash' do
        expect(client.story_creators(id)).to be_a Hashie::Mash
      end
    end

    describe '#story_events' do
      before do
        stub_get("stories/#{id}/events",
                 returns: 'stories/story_events.json')
      end

      it 'fetches a list of events filtered by story id' do
        expect(client.story_events(id).data.results.size).to eq 1
        expect(client.story_events(id).data.results.map(&:title).take(3))
          .to eq ['House of M']
      end

      it 'requests public/v1/stories/#{id}/events successfully' do
        expect(client.story_events(id).status).to eq 'Ok'
      end

      it 'returns a Hashie::Mash' do
        expect(client.story_events(id)).to be_a Hashie::Mash
      end
    end

    describe '#story_series' do
      before do
        stub_get("stories/#{id}/series",
                 returns: 'stories/story_series.json')
      end

      it 'fetches a list of series filtered by story id' do
        expect(client.story_series(id).data.results.size).to eq 2
        expect(client.story_series(id).data.results.map(&:id).take(3))
          .to eq [1614, 632]
      end

      it 'requests public/v1/stories/#{id}/series successfully' do
        expect(client.story_series(id).status).to eq 'Ok'
      end

      it 'returns a Hashie::Mash' do
        expect(client.story_series(id)).to be_a Hashie::Mash
      end
    end
  end
end