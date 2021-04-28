defmodule StatsWatcherTest do
  use ExUnit.Case

  describe "StatsWatcher.mk_stats_url" do
    test "returns the correct url" do
      assert StatsWatcher.mk_stats_url() ==
        "https://api.twitter.com/2/users/by/username/chriswearshats?user.fields=public_metrics"
    end
  end
end
