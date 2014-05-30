# marvel_api
[![Build Status](https://travis-ci.org/O-I/marvel.svg?branch=master)](https://travis-ci.org/O-I/marvel)
[![Coverage Status](https://img.shields.io/coveralls/O-I/marvel.svg)](https://coveralls.io/r/O-I/marvel)

Ruby bindings for the [Marvel API](http://developer.marvel.com/). Still under construction... Feel free to contribute! In the meantime, check out the [marvelite](https://github.com/antillas21/marvelite/) gem for something that's further along in development (and likely a lot stabler :-).

## Installation

`gem install 'marvel_api'` or add `gem 'marvel_api'` to your Gemfile and `bundle`.

## Configuration

You'll need an API key — get yours [here](http://developer.marvel.com). Configure like so:

```ruby
@client = Marvel::Client.new

@client.configure do |config|
  config.api_key = 'YOUR_API_KEY'
  config.private_key = 'YOUR_PRIVATE_KEY'
end
```

## Usage

Descriptions and examples of the supported actions are below. Note, all methods currently return an `Array` of `Hashie:Mash` objects if successful; otherwise, a `Marvel::Response::Error` is returned. For a more detailed explanation of available actions and an exhaustive list of acceptable query parameters, see Marvel's own developer [documentation](http://developer.marvel.com/docs). Each method described below links to the associated call in Marvel's interactive API tester.

### Characters

- Fetches lists of characters. [`GET /v1/public/characters`](http://developer.marvel.com/docs#!/public/getCreatorCollection_get_0)

```ruby
@client.characters
@client.characters(name: 'Thanos')
@client.characters(nameStartsWith: 'Th', orderBy: 'modified')
```

- Fetches a single character by id. [`GET /v1/public/characters/{characterId}`](http://developer.marvel.com/docs#!/public/getCharacterIndividual_get_1)

```ruby
@client.character(1009652)
```

- Fetches lists of comics filtered by a character id. [`GET /v1/public/characters/{characterId}/comics`](http://developer.marvel.com/docs#!/public/getComicsCharacterCollection_get_2)

```ruby
@client.character_comics(1009652)
@client.character_comics(1009652, titleStartsWith: 'Infinity', hasDigitalIssue: true)
```

- Fetches lists of events filtered by a character id. [`GET /v1/public/characters/{characterId}/events`](http://developer.marvel.com/docs#!/public/getCharacterEventsCollection_get_3)

```ruby
@client.character_events(1009652)
@client.character_events(1009652, name: 'Infinity Gauntlet')
```

- Fetches lists of series filtered by a character id. [`GET /v1/public/characters/{characterId}/series`](http://developer.marvel.com/docs#!/public/getCharacterSeriesCollection_get_4)

```ruby
@client.character_series(1009652)
@client.character_series(1009652, contains: 'hardcover')
```

- Fetches lists of stories filtered by a character id. [`GET /v1/public/characters/{characterId}/stories`](http://developer.marvel.com/docs#!/public/getCharacterStoryCollection_get_5)

```ruby
@client.character_stories(1009652)
@client.character_stories(1009652, limit: 50)
```

### Comics

- Fetches lists of comics. [`GET /v1/public/comics`](http://developer.marvel.com/docs#!/public/getComicsCollection_get_6)

```ruby
@client.comics
@client.comics(title: 'Daredevil')
@client.comics(startYear: 1950, issueNumber: 1)
```

- Fetches a single comic by id. [`GET /v1/public/comics/{comicId}`](http://developer.marvel.com/docs#!/public/getComicIndividual_get_7)

```ruby
@client.comic(29380)
```

- Fetches lists of characters filtered by a comic id. [`GET /v1/public/comics/{comicId}/characters`](http://developer.marvel.com/docs#!/public/getComicCharacterCollection_get_8)

```ruby
@client.comic_characters(34249)
@client.comic_characters(34249, orderBy: 'name')
```

- Fetches lists of creators filtered by a comic id. [`GET /v1/public/comics/{comicId}/creators`](http://developer.marvel.com/docs#!/public/getCreatorCollection_get_9)

```ruby
@client.comic_creators(34249)
@client.comic_creators(34249, lastNameStartsWith: 'V')
```

- Fetches lists of events filtered by a comic id. [`GET /v1/public/comics/{comicId}/events`](http://developer.marvel.com/docs#!/public/getIssueEventsCollection_get_10)

```ruby
@client.comic_events(27272)
@client.comic_events(27272, orderBy: '-startDate')
```

- Fetches lists of stories filtered by a comic id. [`GET /v1/public/comics/{comicId}/stories`](http://developer.marvel.com/docs#!/public/getComicStoryCollection_get_11)

```ruby
@client.comic_stories(27272)
@client.comic_stories(27272, creators: [600, 801])
```

### Creators

- Fetches lists of creators. [`GET /v1/public/creators`](http://developer.marvel.com/docs#!/public/getCreatorCollection_get_12)

```ruby
@client.creators
@client.creators(firstName: 'Frank', lastName: 'Miller')
@client.creators(lastNameStartsWith: 'Mo', limit: 20, offset: 20)
```

- Fetches a single creator by id. [`GET /v1/public/creators/{creatorId}`](http://developer.marvel.com/docs#!/public/getCreatorIndividual_get_13)

```ruby
@client.creator(15)
```

- Fetches lists of comics filtered by a creator id. [`GET /v1/public/creators/{creatorId}/comics`](http://developer.marvel.com/docs#!/public/getComicsCollection_get_14)

```ruby
@client.creator_comics(15)
@client.creator_comics(15, format: 'trade paperback')
```

- Fetches lists of events filtered by a creator id. [`GET /v1/public/creators/{creatorId}/events`](http://developer.marvel.com/docs#!/public/getCreatorEventsCollection_get_15)

```ruby
@client.creator_events(30)
@client.creator_events(30, nameStartsWith: 'Civil')
```

- Fetches lists of series filtered by a creator id. [`GET /v1/public/creators/{creatorId}/series`](http://developer.marvel.com/docs#!/public/getCreatorSeriesCollection_get_16)

```ruby
@client.creator_series(30)
@client.creator_series(30, seriesType: 'limited')
```

- Fetches lists of stories filtered by a creator id. [`GET /v1/public/creators/{creatorId}/stories`](http://developer.marvel.com/docs#!/public/getCreatorStoryCollection_get_17)

```ruby
@client.creator_stories(30)
@client.creator_stories(30, limit: 40, offset: 7750)
```

### Events

- Fetches lists of events. [`GET /v1/public/events`](http://developer.marvel.com/docs#!/public/getEventsCollection_get_18)

```ruby
@client.events
@client.events(name: 'Infinity Gauntlet')
@client.events(characters: [1009156, 1009652])
```

- Fetches a single event by id. [`GET /v1/public/events/{eventId}`](http://developer.marvel.com/docs#!/public/getEventIndividual_get_19)

```ruby
@client.event(227)
```

- Fetches lists of characters filtered by an event id. [`GET /v1/public/events/{eventId}/characters`](http://developer.marvel.com/docs#!/public/getEventCharacterCollection_get_20)

```ruby
@client.event_characters(227)
@client.event_characters(227, modifiedSince: '2014-04-29')
```

- Fetches lists of comics filtered by an event id. [`GET /v1/public/events/{eventId}/comics`](http://developer.marvel.com/docs#!/public/getComicsCollection_get_21)

```ruby
@client.event_comics(227)
@client.event_comics(227, hasDigitalIssue: true, orderBy: 'onsaleDate')
```

- Fetches lists of creators filtered by an event id. [`GET /v1/public/events/{eventId}/creators`](http://developer.marvel.com/docs#!/public/getCreatorCollection_get_22)

```ruby
@client.event_creators(227)
@@client.event_creators(227, lastNameStartsWith: 'Lar')
```

- Fetches lists of series filtered by an event id. [`GET /v1/public/events/{eventId}/series`](http://developer.marvel.com/docs#!/public/getEventSeriesCollection_get_23)

```ruby
@client.event_series(227)
@client.event_series(227, startYear: 1995, seriesType: 'limited')
```

- Fetches lists of stories filtered by an event id. [`GET /v1/public/events/{eventId}/stories`](http://developer.marvel.com/docs#!/public/getEventStoryCollection_get_24)

```ruby
@client.event_stories(227)
@client.event_stories(227, orderBy: 'id', limit: 30, offset: 20)
```

### Series

- Fetches lists of series. [`GET /v1/public/series`](http://developer.marvel.com/docs#!/public/getSeriesCollection_get_25)

```ruby
@client.series
@client.series(title: 'Uncanny X-Men')
@client.series(titleStartsWith: 'Astonishing', orderBy: 'startDate', limit: 100)
```

- Fetches a single comic series by id. [`GET /v1/public/series/{seriesId}`](http://developer.marvel.com/docs#!/public/getSeriesIndividual_get_26)

```ruby
@client.serie(354)
```

- Fetches lists of characters filtered by a series id. [`GET /v1/public/series/{seriesId}/characters`](http://developer.marvel.com/docs#!/public/getSeriesCharacterWrapper_get_27)

```ruby
@client.series_characters(354)
@client.series_characters(354, nameStartsWith: 'Iron')
```

- Fetches lists of comics filtered by a series id. [`GET /v1/public/series/{seriesId}/comics`](http://developer.marvel.com/docs#!/public/getComicsCollection_get_28)

```ruby
@client.series_comics(354)
@client.series_comics(354, issueNumber: 1)
```

- Fetches lists of creators filtered by a series id. [`GET /v1/public/series/{seriesId}/creators`](http://developer.marvel.com/docs#!/public/getCreatorCollection_get_29)

```ruby
@client.series_creators(354)
@client.series_creators(354, lastName: 'Kirby')
```

- Fetches lists of events filtered by a series id. [`GET /v1/public/series/{seriesId}/events`](http://developer.marvel.com/docs#!/public/getEventsCollection_get_30)

```ruby
@client.series_events(354)
@client.series_events(354, orderBy: 'startDate')
```

- Fetches lists of stories filtered by a series id. [`GET /v1/public/series/{seriesId}/stories`](http://developer.marvel.com/docs#!/public/getSeriesStoryCollection_get_31)

```ruby
@client.series_stories(354)
@client.series_stories(354, modifiedSince: '2013-06-01')
```

### Stories

- Fetches lists of stories. [`GET /v1/public/stories`](http://developer.marvel.com/docs#!/public/getStoryCollection_get_32)

```ruby
@client.stories
@client.stories(creators: 15)
@client.stories(characters: [1009156, 1009652], orderBy: '-modified')
```

- Fetches a single comic story by id. [`GET /v1/public/stories/{storyId}`](http://developer.marvel.com/docs#!/public/getStoryIndividual_get_33)

```ruby
@client.story(6320)
```

- Fetches lists of characters filtered by a story id. [`GET /v1/public/stories/{storyId}/characters`](http://developer.marvel.com/docs#!/public/getCreatorCollection_get_34)

```ruby
@client.story_characters(14410)
@client.story_characters(14410, nameStartsWith: 'D')
```

- Fetches lists of comics filtered by a story id. [`GET /v1/public/stories/{storyId}/comics`](http://developer.marvel.com/docs#!/public/getComicsCollection_get_35)

```ruby
@client.story_comics(126)
@client.story_comics(126, format: 'trade paperback')
```

- Fetches lists of creators filtered by a story id. [`GET /v1/public/stories/{storyId}/creators`](http://developer.marvel.com/docs#!/public/getCreatorCollection_get_36)

```ruby
@client.story_creators(126)
@client.story_creators(126, lastNameStartsWith: 'S')
```

- Fetches lists of events filtered by a story id. [`GET /v1/public/stories/{storyId}/events`](http://developer.marvel.com/docs#!/public/getEventsCollection_get_37)

```ruby
@client.story_events(12964)
@client.story_events(12964, orderBy: 'name')
```

- Fetches lists of series filtered by a story id. [`GET /v1/public/stories/{storyId}/series`](http://developer.marvel.com/docs#!/public/getStorySeriesCollection_get_38)

```ruby
@client.story_series(126)
@client.story_series(126, titleStartsWith: 'Infinity')
```

## Contributing to marvel_api
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2014 Rahul Horé. See LICENSE.txt for
further details.