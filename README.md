# Porni

Gem to access APIs from principal porn sites. Currently we support video information for porn.com, pornhub.com and redtube.com

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'porni'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install porni

## Usage

We need an agent to know the api to connect. In case the porn site API is not registered, this should raise ```Porni::MissingApiError```
```ruby
# Now acceps ['porn', 'pornhub', 'redtube']
agent = Porni::Client.get_agent(page: 'pornhub')
```

Return raw JSON response for specific video
```ruby
body = agent.get_video('ph5b13376603133')
```

Since pages API returns diferent formats, we return an standardized object
```ruby
video = agent.get_video_standardized('ph5b13376603133')
video.rating #Integer
video.title #string
video.thumb #string
video.duration #string(minutes)
video.channel #string or nil
video.tags #array
video.pornstars #array
video.raw #JSON response from server
video.valid #true when video is found, false when missing video
```

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `rspec` to run the tests.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

