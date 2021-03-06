require 'spec_helper'

describe Marvel::Client do
  let(:client) { marvel_test_client }

  context 'Series endpoints' do
    let(:id) { 354 }

    describe '#series' do
      before do
        stub_get('series', returns: 'series/series.json')
      end

      it 'fetches a list of series' do
        expect(client.series.size).to eq 20
        expect(client.series.map(&:title).take(3))
          .to eq ['100th Anniversary Special (2014 - Present)',
                  '15-Love (2011)',
                  '15-Love GN-TPB (2013 - Present)']
      end

      it 'can order list by startYear' do
        sorted_list = client.series.sort_by {|entry| entry["startYear"]}
        
        sorted_start_years = sorted_list.map {|entry| entry["startYear"]}
        unsorted_start_years = client.series.map {|entry| entry["startYear"]}

        expect(sorted_start_years == unsorted_start_years).to eq(false)
        expect(sorted_start_years == unsorted_start_years.sort).to eq(true)
      end

      it 'requests public/v1/series successfully' do
        expect(client.series.status).to eq 'Ok'
      end

      it 'returns an [ Hashie::Mash ]' do
        expect(client.series).to be_an Array
        expect(client.series.sample).to be_a Hashie::Mash
      end
    end

    describe '#serie' do
      before do
        stub_get("series/#{id}", returns: 'series/serie.json')
      end

      it 'fetches a single series by id' do
        expect(client.serie(id).size).to eq 1
        expect(client.serie(id).pop.title)
          .to eq 'Avengers (1998 - 2004)'
      end

      it 'requests public/v1/series/#{id} successfully' do
        expect(client.serie(id).status).to eq 'Ok'
      end

      it 'returns an [ Hashie::Mash ]' do
        expect(client.serie(id)).to be_an Array
        expect(client.serie(id).sample).to be_a Hashie::Mash
      end
    end

    describe '#series_characters' do
      before do
        stub_get("series/#{id}/characters",
                 returns: 'series/series_characters.json')
      end

      it 'fetches a list of characters filtered by series id' do
        expect(client.series_characters(id).size).to eq 20
        expect(client.series_characters(id).map(&:name).take(3))
          .to eq ['A.I.M.',
                  'Abomination (Emil Blonsky)',
                  'Archangel']
      end

      it 'requests public/v1/series/#{id}/characters successfully' do
        expect(client.series_characters(id).status).to eq 'Ok'
      end

      it 'returns an [ Hashie::Mash ]' do
        expect(client.series_characters(id)).to be_an Array
        expect(client.series_characters(id).sample).to be_a Hashie::Mash
      end
    end

    describe '#series_comics' do
      before do
        stub_get("series/#{id}/comics",
                 returns: 'series/series_comics.json')
      end

      it 'fetches a list of comics filtered by series id' do
        expect(client.series_comics(id).size).to eq 20
        expect(client.series_comics(id).map(&:id).take(3))
          .to eq [923, 845, 767]
      end

      it 'requests public/v1/series/#{id}/comics successfully' do
        expect(client.series_comics(id).status).to eq 'Ok'
      end

      it 'returns an [ Hashie::Mash ]' do
        expect(client.series_comics(id)).to be_an Array
        expect(client.series_comics(id).sample).to be_a Hashie::Mash
      end
    end

    describe '#series_creators' do
      before do
        stub_get("series/#{id}/creators",
                 returns: 'series/series_creators.json')
      end

      it 'fetches a list of creators filtered by series id' do
        expect(client.series_creators(id).size).to eq 20
        expect(client.series_creators(id).map(&:id).take(3))
          .to eq [807, 5744, 6694]
      end

      it 'requests public/v1/series/#{id}/creators successfully' do
        expect(client.series_creators(id).status).to eq 'Ok'
      end

      it 'returns an [ Hashie::Mash ]' do
        expect(client.series_creators(id)).to be_an Array
        expect(client.series_creators(id).sample).to be_a Hashie::Mash
      end
    end

    describe '#series_events' do
      before do
        stub_get("series/#{id}/events",
                 returns: 'series/series_events.json')
      end

      it 'fetches a list of events filtered by series id' do
        expect(client.series_events(id).size).to eq 2
        expect(client.series_events(id).map(&:title))
          .to eq ['Avengers Disassembled', 'Maximum Security']
      end

      it 'requests public/v1/series/#{id}/events successfully' do
        expect(client.series_events(id).status).to eq 'Ok'
      end

      it 'returns an [ Hashie::Mash ]' do
        expect(client.series_events(id)).to be_an Array
        expect(client.series_events(id).sample).to be_a Hashie::Mash
      end
    end

    describe '#series_stories' do
      before do
        stub_get("series/#{id}/stories",
                 returns: 'series/series_stories.json')
      end

      it 'fetches a list of stories filtered by series id' do
        expect(client.series_stories(id).size).to eq 20
        expect(client.series_stories(id).map(&:id).take(3))
          .to eq [490, 542, 572]
      end

      it 'requests public/v1/series/#{id}/stories successfully' do
        expect(client.series_stories(id).status).to eq 'Ok'
      end

      it 'returns an [ Hashie::Mash ]' do
        expect(client.series_stories(id)).to be_an Array
        expect(client.series_stories(id).sample).to be_a Hashie::Mash
      end
    end
  end
end