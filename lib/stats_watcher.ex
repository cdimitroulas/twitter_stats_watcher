defmodule StatsWatcher do
  def mk_stats_url() do
    twitter_url = "https://api.twitter.com/2"
    my_user_id = "806099443095404549"
    user_followers_endpoint = "/users/" <> my_user_id <> "/followers"
    twitter_url <> user_followers_endpoint
  end
end
