defmodule StatsWatcher do
  def mk_stats_url() do
    twitter_url = "https://api.twitter.com/2"
    my_username = "chriswearshats"
    users_endpoint = "/users/by/username/" <> my_username
    query_params = "?user.fields=public_metrics"
    twitter_url <> users_endpoint <> query_params
  end

  def mk_column_names() do
    Enum.join(~w(DateTime Followers Following Listed TweetCount), ",")
  end

  def fetch_stats() do
    now = DateTime.to_string(%{DateTime.utc_now() | microsecond: {0, 0}})
    url = mk_stats_url()
    token = Application.get_env(:stats_watcher, :TWITTER_BEARER_TOKEN)

    %{body: body} =
      HTTPoison.get!(url, [
        {
          "Authorization",
          "BEARER " <> token
        }
      ])

    %{"data" => %{"public_metrics" => stats}} = Poison.decode!(body)

    [
      now,
      stats["followers_count"],
      stats["following_count"],
      stats["listed_count"],
      stats["tweet_count"]
    ]
  end

  def save_csv(stats) do
    filename = "stats.csv"
    fileExists = File.exists? filename

    if !fileExists do
      File.write! filename, mk_column_names() <> "\n"
    end

    File.write! filename, Enum.join(stats, ",") <> "\n", [:append]
  end
end
