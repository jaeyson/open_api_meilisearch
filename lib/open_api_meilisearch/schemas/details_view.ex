defmodule OpenApiMeilisearch.DetailsView do
  @moduledoc """
  Provides struct and type for a DetailsView
  """

  @type t :: %__MODULE__{
          canceledTasks: integer | nil,
          context: map | nil,
          deletedDocuments: integer | nil,
          deletedTasks: integer | nil,
          dumpUid: String.t() | nil,
          editedDocuments: integer | nil,
          function: String.t() | nil,
          indexedDocuments: integer | nil,
          matchedTasks: integer | nil,
          originalFilter: String.t() | nil,
          primaryKey: String.t() | nil,
          providedIds: integer | nil,
          receivedDocuments: integer | nil,
          swaps: [map] | nil,
          upgradeFrom: String.t() | nil,
          upgradeTo: String.t() | nil
        }

  defstruct [
    :canceledTasks,
    :context,
    :deletedDocuments,
    :deletedTasks,
    :dumpUid,
    :editedDocuments,
    :function,
    :indexedDocuments,
    :matchedTasks,
    :originalFilter,
    :primaryKey,
    :providedIds,
    :receivedDocuments,
    :swaps,
    :upgradeFrom,
    :upgradeTo
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      canceledTasks: {:union, [{:integer, "u-int64"}, :null]},
      context: {:union, [:map, :null]},
      deletedDocuments: {:union, [{:integer, "u-int64"}, :null]},
      deletedTasks: {:union, [{:integer, "u-int64"}, :null]},
      dumpUid: {:union, [:string, :null]},
      editedDocuments: {:union, [{:integer, "u-int64"}, :null]},
      function: {:union, [:string, :null]},
      indexedDocuments: {:union, [{:integer, "u-int64"}, :null]},
      matchedTasks: {:union, [{:integer, "u-int64"}, :null]},
      originalFilter: {:union, [:string, :null]},
      primaryKey: {:union, [:string, :null]},
      providedIds: {:union, [:integer, :null]},
      receivedDocuments: {:union, [{:integer, "u-int64"}, :null]},
      swaps: {:union, [[:map], :null]},
      upgradeFrom: {:union, [:string, :null]},
      upgradeTo: {:union, [:string, :null]}
    ]
  end
end
