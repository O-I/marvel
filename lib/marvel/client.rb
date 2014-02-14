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

    def initialize
      reset
    end

    # Requests on the server side must be of the form
    # http://gateway.marvel.com/v1/comics/?ts=1&apikey=1234&hash=ffd275c5130566a2916217b101f26150
    # where ts is a timestamp
    # where apikey is your public API key
    # where hash is the MD5 hash of the concatenation of 
    # ts, your private API key, and your public API key

    # So basic request form for all methods looks like
    # Faraday.get("#{BASE_URL}#{path}#{id}#{stub}#{auth}").body
    # e.g., get_comics_by_character_id
    # Faraday.get("#{BASE_URL}characters/#{id}/comics#{auth}").body

    # TODO; MODULARIZE THIS!!!
    # TODO; Refactor — tons of duplication

    # All methods return a Hashie::Mash object
    # representation of the original JSON response

    # Characters: 

    # fetches lists of characters
    def get_characters
      # v1/public/characters
    end

    # fetches a single character by id
    def get_character(id)
      # v1/public/characters/{characterId}
      get("characters/#{id}#{auth}")
    end

    # fetches lists of comics filtered by a character id
    def get_comics_by_character_id(id)
      # v1/public/characters/{characterId}/comics
      get("characters/#{id}/comics#{auth}")
    end

    # fetches lists of events filtered by a character id
    def get_events_by_character_id(id)
      # v1/public/characters/{characterId}/events
      get("characters/#{id}/events#{auth}")
    end

    # fetches lists of stories filtered by a character id
    def get_stories_by_character_id(id)
      # v1/public/characters/{characterId}/stories
      get("characters/#{id}/stories#{auth}")
    end

    # Comics:

    # fetches lists of comics
    def get_comics
      # v1/public/comics
    end

    # fetches a single comic by id
    def get_comic(id)
      # v1/public/comics/{comicId}
      get("comics/#{id}#{auth}")
    end

    # fetches lists of characters filtered by a comic id
    def get_characters_by_comic_id(id)
      # v1/public/comics/{comicId}/characters
      get("comics/#{id}/characters#{auth}")
    end

    # fetches lists of creators filtered by a comic id
    def get_creators_by_comic_id(id)
      # v1/public/comics/{comicId}/creators
      get("comics/#{id}/creators#{auth}")
    end

    # fetches lists of events filtered by a comic id
    def get_events_by_comic_id(id)
      # v1/public/comics/{comicId}/events
      get("comics/#{id}/events#{auth}")
    end

    # fetches lists of stories filtered by a comic id
    def get_stories_by_comic_id(id)
      # v1/public/comics/{comicId}/stories
      get("comics/#{id}/stories#{auth}")
    end

    # Creators:

    # fetches lists of creators
    def get_creators
      # v1/public/creators
    end

    # fetches a single creator by id
    def get_creator(id)
      # v1/public/creators/{creatorId}
      get("creators/#{id}#{auth}")
    end

    # fetches lists of comics filtered by a creator id
    def get_comics_by_creator_id(id)
      # v1/public/creators/{creatorId}/comics
      get("creators/#{id}/comics#{auth}")
    end

    # fetches lists of events filtered by a creator id
    def get_events_by_creator_id(id)
      # v1/public/creators/{creatorId}/events
      get("creators/#{id}/events#{auth}")
    end

    # fetches lists of stories filtered by a creator id
    def get_stories_by_creator_id(id)
      # v1/public/creators/{creatorId}/stories
      get("creators/#{id}/stories#{auth}")
    end

    # Events:

    # fetches lists of events
    def get_events
      # v1/public/events
    end

    # fetches a single event by id
    def get_event(id)
      # v1/public/events/{eventId}
      get("events/#{id}#{auth}")
    end

     # fetches lists of characters filtered by an event id
    def get_characters_by_event_id(id)
      # v1/public/events/{eventId}/characters
      get("events/#{id}/characters#{auth}")
    end

    # fetches lists of comics filtered by an event id
    def get_comics_by_event_id(id)
      # v1/public/events/{eventId}/comics
      get("events/#{id}/comics#{auth}")
    end

    # fetches lists of creators filtered by an event id
    def get_creators_by_event_id(id)
      # v1/public/events/{eventId}/creators
      get("events/#{id}/creators#{auth}")
    end

    # fetches lists of stories filtered by an event id
    def get_stories_by_event_id(id)
      # v1/public/events/{eventId}/stories
      get("events/#{id}/stories#{auth}")
    end


    # Series:

    # fetches lists of series
    def get_series
      # v1/public/series
    end

    # fetches a single comic series by id
    def get_series_by_id(id)
      # v1/public/series/{seriesId}
      get("series/#{id}#{auth}")
    end

     # fetches lists of characters filtered by a series id
    def get_characters_by_series_id(id)
      # v1/public/series/{seriesId}/characters
      get("series/#{id}/characters#{auth}")
    end

    # fetches lists of comics filtered by a series id
    def get_comics_by_series_id(id)
      # v1/public/series/{seriesId}/comics
      get("series/#{id}/comics#{auth}")
    end

    # fetches lists of creators filtered by a series id
    def get_creators_by_series_id(id)
      # v1/public/series/{seriesId}/creators
      get("series/#{id}/creators#{auth}")
    end

    # fetches lists of events filtered by a series id
    def get_events_by_series_id(id)
      # v1/public/series/{seriesId}/events
      get("series/#{id}/events#{auth}")
    end

    # fetches lists of stories filtered by a series id
    def get_stories_by_series_id(id)
      # v1/public/series/{seriesId}/stories
      get("series/#{id}/stories#{auth}")
    end

    # Stories:

    # fetches lists of stories
    def get_stories
      # v1/public/stories
    end

    # fetches a single comic story by id
    def get_story(id)
      # v1/public/stories/{storyId}
      get("stories/#{id}#{auth}")
    end

     # fetches lists of characters filtered by a story id
    def get_characters_by_story_id(id)
      # v1/public/stories/{storyId}/characters
      get("stories/#{id}/characters#{auth}")
    end

    # fetches lists of comics filtered by a story id
    def get_comics_by_story_id(id)
      # v1/public/stories/{storyId}/comics
      get("stories/#{id}/comics#{auth}")
    end

    # fetches lists of creators filtered by a story id
    def get_creators_by_story_id(id)
      # v1/public/stories/{storyId}/creators
      get("stories/#{id}/creators#{auth}")
    end

    # fetches lists of events filtered by a story id
    def get_events_by_story_id(id)
      # v1/public/stories/{storyId}/events
      get("stories/#{id}/events#{auth}")
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