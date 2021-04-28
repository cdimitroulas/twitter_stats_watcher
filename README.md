# StatsWatcher

Fetches my twitter follower count and other stats and saves them in a CSV regularly.

## Setup

A `config/secrets.exs` file needs to be created with the following format:

```elixir
config :stats_watcher_app,
  TWITTER_API_KEY: '',
  TWITTER_API_SECRET_KEY: '',
  TWITTER_BEARER_TOKEN: ''
```

