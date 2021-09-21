defmodule Teiserver.Chat do
  import Ecto.Query, warn: false
  alias Central.Helpers.QueryHelpers
  alias Central.Repo

  alias Teiserver.Chat.RoomMessage
  alias Teiserver.Chat.RoomMessageLib

  @spec room_message_query(List.t()) :: Ecto.Query.t()
  def room_message_query(args) do
    room_message_query(nil, args)
  end

  @spec room_message_query(Integer.t(), List.t()) :: Ecto.Query.t()
  def room_message_query(id, args) do
    RoomMessageLib.query_room_messages
    |> RoomMessageLib.search(%{id: id})
    |> RoomMessageLib.search(args[:search])
    |> RoomMessageLib.preload(args[:preload])
    |> RoomMessageLib.order_by(args[:order_by])
    |> QueryHelpers.select(args[:select])
  end

  @doc """
  Returns the list of room_messages.

  ## Examples

      iex> list_room_messages()
      [%RoomMessage{}, ...]

  """
  @spec list_room_messages(List.t()) :: List.t()
  def list_room_messages(args \\ []) do
    room_message_query(args)
    |> QueryHelpers.limit_query(args[:limit] || 50)
    |> Repo.all
  end

  @doc """
  Gets a single room_message.

  Raises `Ecto.NoResultsError` if the RoomMessage does not exist.

  ## Examples

      iex> get_room_message!(123)
      %RoomMessage{}

      iex> get_room_message!(456)
      ** (Ecto.NoResultsError)

  """
  @spec get_room_message!(Integer.t() | List.t()) :: RoomMessage.t()
  @spec get_room_message!(Integer.t(), List.t()) :: RoomMessage.t()
  def get_room_message!(id) when not is_list(id) do
    room_message_query(id, [])
    |> Repo.one!
  end
  def get_room_message!(args) do
    room_message_query(nil, args)
    |> Repo.one!
  end
  def get_room_message!(id, args) do
    room_message_query(id, args)
    |> Repo.one!
  end

  # Uncomment this if needed, default files do not need this function
  # @doc """
  # Gets a single room_message.

  # Returns `nil` if the RoomMessage does not exist.

  # ## Examples

  #     iex> get_room_message(123)
  #     %RoomMessage{}

  #     iex> get_room_message(456)
  #     nil

  # """
  # def get_room_message(id, args \\ []) when not is_list(id) do
  #   room_message_query(id, args)
  #   |> Repo.one
  # end

  @doc """
  Creates a room_message.

  ## Examples

      iex> create_room_message(%{field: value})
      {:ok, %RoomMessage{}}

      iex> create_room_message(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  @spec create_room_message(Map.t()) :: {:ok, RoomMessage.t()} | {:error, Ecto.Changeset.t()}
  def create_room_message(attrs \\ %{}) do
    %RoomMessage{}
    |> RoomMessage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a room_message.

  ## Examples

      iex> update_room_message(room_message, %{field: new_value})
      {:ok, %RoomMessage{}}

      iex> update_room_message(room_message, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  @spec update_room_message(RoomMessage.t(), Map.t()) :: {:ok, RoomMessage.t()} | {:error, Ecto.Changeset.t()}
  def update_room_message(%RoomMessage{} = room_message, attrs) do
    room_message
    |> RoomMessage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a RoomMessage.

  ## Examples

      iex> delete_room_message(room_message)
      {:ok, %RoomMessage{}}

      iex> delete_room_message(room_message)
      {:error, %Ecto.Changeset{}}

  """
  @spec delete_room_message(RoomMessage.t()) :: {:ok, RoomMessage.t()} | {:error, Ecto.Changeset.t()}
  def delete_room_message(%RoomMessage{} = room_message) do
    Repo.delete(room_message)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking room_message changes.

  ## Examples

      iex> change_room_message(room_message)
      %Ecto.Changeset{source: %RoomMessage{}}

  """
  @spec change_room_message(RoomMessage.t()) :: Ecto.Changeset.t()
  def change_room_message(%RoomMessage{} = room_message) do
    RoomMessage.changeset(room_message, %{})
  end

  alias Teiserver.Chat.LobbyMessage
  alias Teiserver.Chat.LobbyMessageLib

  @spec lobby_message_query(List.t()) :: Ecto.Query.t()
  def lobby_message_query(args) do
    lobby_message_query(nil, args)
  end

  @spec lobby_message_query(Integer.t(), List.t()) :: Ecto.Query.t()
  def lobby_message_query(id, args) do
    LobbyMessageLib.query_lobby_messages
    |> LobbyMessageLib.search(%{id: id})
    |> LobbyMessageLib.search(args[:search])
    |> LobbyMessageLib.preload(args[:preload])
    |> LobbyMessageLib.order_by(args[:order_by])
    |> QueryHelpers.select(args[:select])
  end

  @doc """
  Returns the list of lobby_messages.

  ## Examples

      iex> list_lobby_messages()
      [%LobbyMessage{}, ...]

  """
  @spec list_lobby_messages(List.t()) :: List.t()
  def list_lobby_messages(args \\ []) do
    lobby_message_query(args)
    |> QueryHelpers.limit_query(args[:limit] || 50)
    |> Repo.all
  end

  @doc """
  Gets a single lobby_message.

  Raises `Ecto.NoResultsError` if the LobbyMessage does not exist.

  ## Examples

      iex> get_lobby_message!(123)
      %LobbyMessage{}

      iex> get_lobby_message!(456)
      ** (Ecto.NoResultsError)

  """
  @spec get_lobby_message!(Integer.t() | List.t()) :: LobbyMessage.t()
  @spec get_lobby_message!(Integer.t(), List.t()) :: LobbyMessage.t()
  def get_lobby_message!(id) when not is_list(id) do
    lobby_message_query(id, [])
    |> Repo.one!
  end
  def get_lobby_message!(args) do
    lobby_message_query(nil, args)
    |> Repo.one!
  end
  def get_lobby_message!(id, args) do
    lobby_message_query(id, args)
    |> Repo.one!
  end

  # Uncomment this if needed, default files do not need this function
  # @doc """
  # Gets a single lobby_message.

  # Returns `nil` if the LobbyMessage does not exist.

  # ## Examples

  #     iex> get_lobby_message(123)
  #     %LobbyMessage{}

  #     iex> get_lobby_message(456)
  #     nil

  # """
  # def get_lobby_message(id, args \\ []) when not is_list(id) do
  #   lobby_message_query(id, args)
  #   |> Repo.one
  # end

  @doc """
  Creates a lobby_message.

  ## Examples

      iex> create_lobby_message(%{field: value})
      {:ok, %LobbyMessage{}}

      iex> create_lobby_message(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  @spec create_lobby_message(Map.t()) :: {:ok, LobbyMessage.t()} | {:error, Ecto.Changeset.t()}
  def create_lobby_message(attrs \\ %{}) do
    %LobbyMessage{}
    |> LobbyMessage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a lobby_message.

  ## Examples

      iex> update_lobby_message(lobby_message, %{field: new_value})
      {:ok, %LobbyMessage{}}

      iex> update_lobby_message(lobby_message, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  @spec update_lobby_message(LobbyMessage.t(), Map.t()) :: {:ok, LobbyMessage.t()} | {:error, Ecto.Changeset.t()}
  def update_lobby_message(%LobbyMessage{} = lobby_message, attrs) do
    lobby_message
    |> LobbyMessage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a LobbyMessage.

  ## Examples

      iex> delete_lobby_message(lobby_message)
      {:ok, %LobbyMessage{}}

      iex> delete_lobby_message(lobby_message)
      {:error, %Ecto.Changeset{}}

  """
  @spec delete_lobby_message(LobbyMessage.t()) :: {:ok, LobbyMessage.t()} | {:error, Ecto.Changeset.t()}
  def delete_lobby_message(%LobbyMessage{} = lobby_message) do
    Repo.delete(lobby_message)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking lobby_message changes.

  ## Examples

      iex> change_lobby_message(lobby_message)
      %Ecto.Changeset{source: %LobbyMessage{}}

  """
  @spec change_lobby_message(LobbyMessage.t()) :: Ecto.Changeset.t()
  def change_lobby_message(%LobbyMessage{} = lobby_message) do
    LobbyMessage.changeset(lobby_message, %{})
  end
end