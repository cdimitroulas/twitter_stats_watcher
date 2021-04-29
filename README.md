# StatsWatcher

Fetches my twitter follower count and other stats and saves them in a CSV regularly.

Built by following this video and adapting it appropriately:
https://www.youtube.com/watch?v=vqxyhJewKjI&list=PLFhQVxlaKQEnOuhDZ5p8jB9U-GHM9U8VM

## Setup

A `config/secrets.exs` file needs to be created with the following format:

```elixir
config :stats_watcher_app,
  TWITTER_BEARER_TOKEN: ''
```

