defmodule StatsWatcher.Scheduler do
  use GenServer

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  @impl true
  def init(state) do
    handle_info(:work, state)
    {:ok, state}
  end

  @impl true
  def handle_info(:work, state) do
    StatsWatcher.run() 
    schedule_work()

    {:noreply, state}
  end

  defp schedule_work do
    Process.send_after(self(), :work, 24 * 60 * 60 * 1000) 
  end
  
end
