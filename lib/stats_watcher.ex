defmodule StatsWatcher do
  def mk_stats_url() do
    twitter_url = "https://api.twitter.com/2"
    my_username = "chriswearshats"
    users_endpoint = "/users/by/username/" <> my_username
    query_params = "?user.fields=public_metrics"
    twitter_url <> users_endpoint <> query_params
  end
end
