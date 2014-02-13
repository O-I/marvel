require 'pry'
require 'json'
require 'time'
require 'faraday'
require 'digest/md5'
require_relative 'request'
require_relative 'connection'
require_relative 'configuration'

module Marvel
  class Client
    include Marvel::Request
    include Marvel::Connection
    include Marvel::Configuration

    # BASE_URL = 'https://gateway.marvel.com/v1/public/'

    def initialize
      reset
    end

    binding.pry

    # Requests on the server side must be of the form
    # http://gateway.marvel.com/v1/comics/?ts=1&apikey=1234&hash=ffd275c5130566a2916217b101f26150
    # where ts is a timestamp
    # where apikey is your public API key
    # where hash is the MD5 hash of the concatenation of 
    # ts, your private API key, and your public API key

    # TODO; MODULARIZE THIS!!!
    # TODO; Refactor — tons of duplication

    # Characters: 

    # fetches lists of characters
    def get_characters
      # v1/public/characters
    end

    # fetches a single character by id
    def get_character(id)
      # v1/public/characters/{characterId}
      Faraday.get("#{BASE_URL}characters/#{id}#{auth}").body
      # get("characters/#{id}#{auth}")
    end

    # fetches lists of comics filtered by a character id
    def get_comics_by_character_id(id)
      # v1/public/characters/{characterId}/comics
      Faraday.get("#{BASE_URL}characters/#{id}/comics#{auth}").body
    end

    # fetches lists of events filtered by a character id
    def get_events_by_character_id(id)
      # v1/public/characters/{characterId}/events
      Faraday.get("#{BASE_URL}characters/#{id}/events#{auth}").body
    end

    # fetches lists of stories filtered by a character id
    def get_stories_by_character_id(id)
      # v1/public/characters/{characterId}/stories
      Faraday.get("#{BASE_URL}characters/#{id}/stories#{auth}").body
    end

    # Comics:

    # fetches lists of comics
    def get_comics
      # v1/public/comics
    end

    # fetches a single comic by id
    def get_comic(id)
      # v1/public/comics/{comicId}
      Faraday.get("#{BASE_URL}comics/#{id}#{auth}").body
    end

    # fetches lists of characters filtered by a comic id
    def get_characters_by_comic_id(id)
      # v1/public/comics/{comicId}/characters
      Faraday.get("#{BASE_URL}comics/#{id}/characters#{auth}").body
    end

    # fetches lists of creators filtered by a comic id
    def get_creators_by_comic_id(id)
      # v1/public/comics/{comicId}/creators
      Faraday.get("#{BASE_URL}comics/#{id}/creators#{auth}").body
    end

    # fetches lists of events filtered by a comic id
    def get_events_by_comic_id(id)
      # v1/public/comics/{comicId}/events
      Faraday.get("#{BASE_URL}comics/#{id}/events#{auth}").body
    end

    # fetches lists of stories filtered by a comic id
    def get_stories_by_comic_id(id)
      # v1/public/comics/{comicId}/stories
      Faraday.get("#{BASE_URL}comics/#{id}/stories#{auth}").body
    end

    # Creators:

    # fetches lists of creators
    def get_creators
      # v1/public/creators
    end

    # fetches a single creator by id
    def get_creator(id)
      # v1/public/creators/{creatorId}
      Faraday.get("#{BASE_URL}creators/#{id}#{auth}").body
    end

    # fetches lists of comics filtered by a creator id
    def get_comics_by_creator_id(id)
      # v1/public/creators/{creatorId}/comics
      Faraday.get("#{BASE_URL}creators/#{id}/comics#{auth}").body
    end

    # fetches lists of events filtered by a creator id
    def get_events_by_creator_id(id)
      # v1/public/creators/{creatorId}/events
      Faraday.get("#{BASE_URL}creators/#{id}/events#{auth}").body
    end

    # fetches lists of stories filtered by a creator id
    def get_stories_by_creator_id(id)
      # v1/public/creators/{creatorId}/stories
      Faraday.get("#{BASE_URL}creators/#{id}/stories#{auth}").body
    end

    # Events:

    # fetches lists of events
    def get_events
      # v1/public/events
    end

    # fetches a single event by id
    def get_event(id)
      # v1/public/events/{eventId}
      Faraday.get("#{BASE_URL}events/#{id}#{auth}").body
    end

     # fetches lists of characters filtered by an event id
    def get_characters_by_event_id(id)
      # v1/public/events/{eventId}/characters
      Faraday.get("#{BASE_URL}events/#{id}/characters#{auth}").body
    end

    # fetches lists of comics filtered by an event id
    def get_comics_by_event_id(id)
      # v1/public/events/{eventId}/comics
      Faraday.get("#{BASE_URL}events/#{id}/comics#{auth}").body
    end

    # fetches lists of creators filtered by an event id
    def get_creators_by_event_id(id)
      # v1/public/events/{eventId}/creators
      Faraday.get("#{BASE_URL}events/#{id}/creators#{auth}").body
    end

    # fetches lists of stories filtered by an event id
    def get_stories_by_event_id(id)
      # v1/public/events/{eventId}/stories
      Faraday.get("#{BASE_URL}events/#{id}/stories#{auth}").body
    end


    # Series:

    # fetches lists of series
    def get_series
      # v1/public/series
    end

    # fetches a single comic series by id
    def get_series_by_id(id)
      # v1/public/series/{seriesId}
      Faraday.get("#{BASE_URL}series/#{id}#{auth}").body
    end

     # fetches lists of characters filtered by a series id
    def get_characters_by_series_id(id)
      # v1/public/series/{seriesId}/characters
      Faraday.get("#{BASE_URL}series/#{id}/characters#{auth}").body
    end

    # fetches lists of comics filtered by a series id
    def get_comics_by_series_id(id)
      # v1/public/series/{seriesId}/comics
      Faraday.get("#{BASE_URL}series/#{id}/comics#{auth}").body
    end

    # fetches lists of creators filtered by a series id
    def get_creators_by_series_id(id)
      # v1/public/series/{seriesId}/creators
      Faraday.get("#{BASE_URL}series/#{id}/creators#{auth}").body
    end

    # fetches lists of events filtered by a series id
    def get_events_by_series_id(id)
      # v1/public/series/{seriesId}/events
      Faraday.get("#{BASE_URL}series/#{id}/events#{auth}").body
    end

    # fetches lists of stories filtered by a series id
    def get_stories_by_series_id(id)
      # v1/public/series/{seriesId}/stories
      Faraday.get("#{BASE_URL}series/#{id}/stories#{auth}").body
    end

    # Stories:

    # fetches lists of stories
    def get_stories
      # v1/public/stories
    end

    # fetches a single comic story by id
    def get_story(id)
      # v1/public/stories/{storyId}
      Faraday.get("#{BASE_URL}stories/#{id}#{auth}").body
    end

     # fetches lists of characters filtered by a story id
    def get_characters_by_story_id(id)
      # v1/public/stories/{storyId}/characters
      Faraday.get("#{BASE_URL}stories/#{id}/characters#{auth}").body
    end

    # fetches lists of comics filtered by a story id
    def get_comics_by_story_id(id)
      # v1/public/stories/{storyId}/comics
      Faraday.get("#{BASE_URL}stories/#{id}/comics#{auth}").body
    end

    # fetches lists of creators filtered by a story id
    def get_creators_by_story_id(id)
      # v1/public/stories/{storyId}/creators
      Faraday.get("#{BASE_URL}stories/#{id}/creators#{auth}").body
    end

    # fetches lists of events filtered by a story id
    def get_events_by_story_id(id)
      # v1/public/stories/{storyId}/events
      Faraday.get("#{BASE_URL}stories/#{id}/events#{auth}").body
    end

    private

    def auth
      ts = timestamp
      hsh = hash(ts)
      "?ts=#{ts}&apikey=#{api_key}&hash=#{hsh}"
    end

    def hash(ts)
      Digest::MD5.hexdigest(ts + private_key + api_key)
    end

    def timestamp
      Time.now.to_s
    end
  end
end