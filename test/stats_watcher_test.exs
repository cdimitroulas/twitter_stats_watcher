defmodule StatsWatcherTest do
  use ExUnit.Case

  describe "StatsWatcher.mk_stats_url" do
    test "returns the correct url" do
      assert StatsWatcher.mk_stats_url() == "https://api.twitter.com/2/users/806099443095404549/followers"
    end
  end
end
