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
    #       apikey is your public API key
    #       hash is the MD5 hash of the concatenation of
    #       ts, your private API key, and your public API key

    # All methods return an Array of Hashie::Mash objects
    # that represent the original JSON response

    # Characters:

    # fetches lists of characters
    def characters(options = {})
      # v1/public/characters
      get('characters', options)
    end

    # fetches a single character by id
    def character(id, options = {})
      # v1/public/characters/{characterId}
      get("characters/#{id}", options)
    end

    # fetches lists of comics filtered by a character id
    def character_comics(id, options = {})
      # v1/public/characters/{characterId}/comics
      get("characters/#{id}/comics", options)
    end

    # fetches lists of events filtered by a character id
    def character_events(id, options = {})
      # v1/public/characters/{characterId}/events
      get("characters/#{id}/events", options)
    end

    # fetches lists of series filtered by a character id
    def character_series(id, options = {})
      # vi/public/characters/{characterId}/series
      get("characters/#{id}/series", options)
    end

    # fetches lists of stories filtered by a character id
    def character_stories(id, options = {})
      # v1/public/characters/{characterId}/stories
      get("characters/#{id}/stories", options)
    end

    # Comics:

    # fetches lists of comics
    def comics(options = {})
      # v1/public/comics
      get('comics', options)
    end

    # fetches a single comic by id
    def comic(id, options = {})
      # v1/public/comics/{comicId}
      get("comics/#{id}", options)
    end

    # fetches lists of characters filtered by a comic id
    def comic_characters(id, options = {})
      # v1/public/comics/{comicId}/characters
      get("comics/#{id}/characters", options)
    end

    # fetches lists of creators filtered by a comic id
    def comic_creators(id, options = {})
      # v1/public/comics/{comicId}/creators
      get("comics/#{id}/creators", options)
    end

    # fetches lists of events filtered by a comic id
    def comic_events(id, options = {})
      # v1/public/comics/{comicId}/events
      get("comics/#{id}/events", options)
    end

    # fetches lists of stories filtered by a comic id
    def comic_stories(id, options = {})
      # v1/public/comics/{comicId}/stories
      get("comics/#{id}/stories", options)
    end

    # Creators:

    # fetches lists of creators
    def creators(options = {})
      # v1/public/creators
      get('creators', options)
    end

    # fetches a single creator by id
    def creator(id, options = {})
      # v1/public/creators/{creatorId}
      get("creators/#{id}", options)
    end

    # fetches lists of comics filtered by a creator id
    def creator_comics(id, options = {})
      # v1/public/creators/{creatorId}/comics
      get("creators/#{id}/comics", options)
    end

    # fetches lists of events filtered by a creator id
    def creator_events(id, options = {})
      # v1/public/creators/{creatorId}/events
      get("creators/#{id}/events", options)
    end

     # fetches lists of series filtered by a creator id
    def creator_series(id, options = {})
      # v1/public/creators/{creatorId}/series
      get("creators/#{id}/series", options)
    end

    # fetches lists of stories filtered by a creator id
    def creator_stories(id, options = {})
      # v1/public/creators/{creatorId}/stories
      get("creators/#{id}/stories", options)
    end

    # Events:

    # fetches lists of events
    def events(options = {})
      # v1/public/events
      get('events', options)
    end

    # fetches a single event by id
    def event(id, options = {})
      # v1/public/events/{eventId}
      get("events/#{id}", options)
    end

     # fetches lists of characters filtered by an event id
    def event_characters(id, options = {})
      # v1/public/events/{eventId}/characters
      get("events/#{id}/characters", options)
    end

    # fetches lists of comics filtered by an event id
    def event_comics(id, options = {})
      # v1/public/events/{eventId}/comics
      get("events/#{id}/comics", options)
    end

    # fetches lists of creators filtered by an event id
    def event_creators(id, options = {})
      # v1/public/events/{eventId}/creators
      get("events/#{id}/creators", options)
    end

    # fetches lists of series filtered by an event id
    def event_series(id, options = {})
      # vi/public/events/{eventId}/series
      get("events/#{id}/series", options)
    end

    # fetches lists of stories filtered by an event id
    def event_stories(id, options = {})
      # v1/public/events/{eventId}/stories
      get("events/#{id}/stories", options)
    end


    # Series:

    # fetches lists of series
    def series(options = {})
      # v1/public/series
      get('series', options)
    end

    # fetches a single comic series by id
    def serie(id, options = {})
      # v1/public/series/{seriesId}
      get("series/#{id}", options)
    end

     # fetches lists of characters filtered by a series id
    def series_characters(id, options = {})
      # v1/public/series/{seriesId}/characters
      get("series/#{id}/characters", options)
    end

    # fetches lists of comics filtered by a series id
    def series_comics(id, options = {})
      # v1/public/series/{seriesId}/comics
      get("series/#{id}/comics", options)
    end

    # fetches lists of creators filtered by a series id
    def series_creators(id, options = {})
      # v1/public/series/{seriesId}/creators
      get("series/#{id}/creators", options)
    end

    # fetches lists of events filtered by a series id
    def series_events(id, options = {})
      # v1/public/series/{seriesId}/events
      get("series/#{id}/events", options)
    end

    # fetches lists of stories filtered by a series id
    def series_stories(id, options = {})
      # v1/public/series/{seriesId}/stories
      get("series/#{id}/stories", options)
    end

    # Stories:

    # fetches lists of stories
    def stories(options = {})
      # v1/public/stories
      get('stories', options)
    end

    # fetches a single comic story by id
    def story(id, options = {})
      # v1/public/stories/{storyId}
      get("stories/#{id}", options)
    end

     # fetches lists of characters filtered by a story id
    def story_characters(id, options = {})
      # v1/public/stories/{storyId}/characters
      get("stories/#{id}/characters", options)
    end

    # fetches lists of comics filtered by a story id
    def story_comics(id, options = {})
      # v1/public/stories/{storyId}/comics
      get("stories/#{id}/comics", options)
    end

    # fetches lists of creators filtered by a story id
    def story_creators(id, options = {})
      # v1/public/stories/{storyId}/creators
      get("stories/#{id}/creators", options)
    end

    # fetches lists of events filtered by a story id
    def story_events(id, options = {})
      # v1/public/stories/{storyId}/events
      get("stories/#{id}/events", options)
    end

    # fetches lists of series filtered by a story id
    def story_series(id, options = {})
      # v1/public/stories/{storyId}/series
      get("stories/#{id}/series", options)
    end
  end
end