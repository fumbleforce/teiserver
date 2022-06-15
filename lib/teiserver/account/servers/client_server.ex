defmodule Teiserver.Account.ClientServer do
  use GenServer
  require Logger
  # alias Teiserver.{Account}

  @impl true
  def handle_call(:get_client_state, _from, state) do
    {:reply, %{state.client | players: state.member_list}, state}
  end

  def handle_call({:get, key}, _from, state) do
    {:reply, Map.get(state, key), state}
  end

  @impl true
  def handle_cast({:update_value, key, value}, state) do
    new_client = Map.put(state.client, key, value)
    {:noreply, %{state | client: new_client}}
  end

  def handle_cast({:update_client, new_client}, state) do
    {:noreply, %{state | client: new_client}}
  end

  @spec start_link(List.t()) :: :ignore | {:error, any} | {:ok, pid}
  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts[:data], [])
  end

  @impl true
  @spec init(Map.t()) :: {:ok, Map.t()}
  def init(state = %{client: %{userid: userid}}) do
    # Update the queue pids cache to point to this process
    Horde.Registry.register(
      Teiserver.ClientRegistry,
      userid,
      state.client.lobby_client
    )

    {:ok, Map.merge(state, %{
      userid: userid
    })}
  end
end