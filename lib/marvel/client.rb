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
    def get_characters(options = {})
      # v1/public/characters
      get('characters', options)
    end

    # fetches a single character by id
    def get_character(id)
      # v1/public/characters/{characterId}
      get("characters/#{id}")
    end

    # fetches lists of comics filtered by a character id
    def get_comics_by_character_id(id)
      # v1/public/characters/{characterId}/comics
      get("characters/#{id}/comics")
    end

    # fetches lists of events filtered by a character id
    def get_events_by_character_id(id)
      # v1/public/characters/{characterId}/events
      get("characters/#{id}/events")
    end

    # fetches lists of stories filtered by a character id
    def get_stories_by_character_id(id)
      # v1/public/characters/{characterId}/stories
      get("characters/#{id}/stories")
    end

    # Comics:

    # fetches lists of comics
    def get_comics(options = {})
      # v1/public/comics
      get('comics', options)
    end

    # fetches a single comic by id
    def get_comic(id)
      # v1/public/comics/{comicId}
      get("comics/#{id}")
    end

    # fetches lists of characters filtered by a comic id
    def get_characters_by_comic_id(id)
      # v1/public/comics/{comicId}/characters
      get("comics/#{id}/characters")
    end

    # fetches lists of creators filtered by a comic id
    def get_creators_by_comic_id(id)
      # v1/public/comics/{comicId}/creators
      get("comics/#{id}/creators")
    end

    # fetches lists of events filtered by a comic id
    def get_events_by_comic_id(id)
      # v1/public/comics/{comicId}/events
      get("comics/#{id}/events")
    end

    # fetches lists of stories filtered by a comic id
    def get_stories_by_comic_id(id)
      # v1/public/comics/{comicId}/stories
      get("comics/#{id}/stories")
    end

    # Creators:

    # fetches lists of creators
    def get_creators(options = {})
      # v1/public/creators
      get('creators', options)
    end

    # fetches a single creator by id
    def get_creator(id)
      # v1/public/creators/{creatorId}
      get("creators/#{id}")
    end

    # fetches lists of comics filtered by a creator id
    def get_comics_by_creator_id(id)
      # v1/public/creators/{creatorId}/comics
      get("creators/#{id}/comics")
    end

    # fetches lists of events filtered by a creator id
    def get_events_by_creator_id(id)
      # v1/public/creators/{creatorId}/events
      get("creators/#{id}/events")
    end

    # fetches lists of stories filtered by a creator id
    def get_stories_by_creator_id(id)
      # v1/public/creators/{creatorId}/stories
      get("creators/#{id}/stories")
    end

    # Events:

    # fetches lists of events
    def get_events(options = {})
      # v1/public/events
      get('events', options)
    end

    # fetches a single event by id
    def get_event(id)
      # v1/public/events/{eventId}
      get("events/#{id}")
    end

     # fetches lists of characters filtered by an event id
    def get_characters_by_event_id(id)
      # v1/public/events/{eventId}/characters
      get("events/#{id}/characters")
    end

    # fetches lists of comics filtered by an event id
    def get_comics_by_event_id(id)
      # v1/public/events/{eventId}/comics
      get("events/#{id}/comics")
    end

    # fetches lists of creators filtered by an event id
    def get_creators_by_event_id(id)
      # v1/public/events/{eventId}/creators
      get("events/#{id}/creators")
    end

    # fetches lists of stories filtered by an event id
    def get_stories_by_event_id(id)
      # v1/public/events/{eventId}/stories
      get("events/#{id}/stories")
    end


    # Series:

    # fetches lists of series
    def get_series(options = {})
      # v1/public/series
      get('series', options)
    end

    # fetches a single comic series by id
    def get_series_by_id(id)
      # v1/public/series/{seriesId}
      get("series/#{id}")
    end

     # fetches lists of characters filtered by a series id
    def get_characters_by_series_id(id)
      # v1/public/series/{seriesId}/characters
      get("series/#{id}/characters")
    end

    # fetches lists of comics filtered by a series id
    def get_comics_by_series_id(id)
      # v1/public/series/{seriesId}/comics
      get("series/#{id}/comics")
    end

    # fetches lists of creators filtered by a series id
    def get_creators_by_series_id(id)
      # v1/public/series/{seriesId}/creators
      get("series/#{id}/creators")
    end

    # fetches lists of events filtered by a series id
    def get_events_by_series_id(id)
      # v1/public/series/{seriesId}/events
      get("series/#{id}/events")
    end

    # fetches lists of stories filtered by a series id
    def get_stories_by_series_id(id)
      # v1/public/series/{seriesId}/stories
      get("series/#{id}/stories")
    end

    # Stories:

    # fetches lists of stories
    def get_stories(options = {})
      # v1/public/stories
      get('stories', options)
    end

    # fetches a single comic story by id
    def get_story(id)
      # v1/public/stories/{storyId}
      get("stories/#{id}")
    end

     # fetches lists of characters filtered by a story id
    def get_characters_by_story_id(id)
      # v1/public/stories/{storyId}/characters
      get("stories/#{id}/characters")
    end

    # fetches lists of comics filtered by a story id
    def get_comics_by_story_id(id)
      # v1/public/stories/{storyId}/comics
      get("stories/#{id}/comics")
    end

    # fetches lists of creators filtered by a story id
    def get_creators_by_story_id(id)
      # v1/public/stories/{storyId}/creators
      get("stories/#{id}/creators")
    end

    # fetches lists of events filtered by a story id
    def get_events_by_story_id(id)
      # v1/public/stories/{storyId}/events
      get("stories/#{id}/events")
    end
  end
end