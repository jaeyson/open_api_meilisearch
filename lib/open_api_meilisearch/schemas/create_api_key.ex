defmodule OpenApiMeilisearch.CreateApiKey do
  @moduledoc """
  Provides struct and type for a CreateApiKey
  """

  @type t :: %__MODULE__{
          actions: [String.t()],
          description: String.t() | nil,
          expiresAt: DateTime.t() | nil,
          indexes: [String.t()],
          name: String.t() | nil,
          uid: String.t()
        }

  defstruct [:actions, :description, :expiresAt, :indexes, :name, :uid]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actions: [
        enum: [
          "*",
          "search",
          "documents.*",
          "documents.add",
          "documents.get",
          "documents.delete",
          "indexes.*",
          "indexes.create",
          "indexes.get",
          "indexes.update",
          "indexes.delete",
          "indexes.swap",
          "tasks.*",
          "tasks.cancel",
          "tasks.delete",
          "tasks.get",
          "settings.*",
          "settings.get",
          "settings.update",
          "stats.*",
          "stats.get",
          "metrics.*",
          "metrics.get",
          "dumps.*",
          "dumps.create",
          "snapshots.*",
          "snapshots.create",
          "version",
          "keys.create",
          "keys.get",
          "keys.update",
          "keys.delete",
          "experimental.get",
          "experimental.update",
          "network.get",
          "network.update",
          "chatCompletions",
          "chats.*",
          "chats.get",
          "chats.delete",
          "chatsSettings.*",
          "chatsSettings.get",
          "chatsSettings.update"
        ]
      ],
      description: {:union, [:string, :null]},
      expiresAt: {:union, [{:string, "date-time"}, :null]},
      indexes: [:string],
      name: {:union, [:string, :null]},
      uid: {:string, "uuid"}
    ]
  end
end
