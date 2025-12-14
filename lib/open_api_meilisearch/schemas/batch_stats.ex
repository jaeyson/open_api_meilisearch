defmodule OpenApiMeilisearch.BatchStats do
  @moduledoc """
  Provides struct and type for a BatchStats
  """

  @type t :: %__MODULE__{
          indexUids: map,
          internalDatabaseSizes: map | nil,
          progressTrace: map | nil,
          status: map,
          totalNbTasks: integer,
          types: map,
          writeChannelCongestion: map | nil
        }

  defstruct [
    :indexUids,
    :internalDatabaseSizes,
    :progressTrace,
    :status,
    :totalNbTasks,
    :types,
    :writeChannelCongestion
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      indexUids: :map,
      internalDatabaseSizes: :map,
      progressTrace: :map,
      status: :map,
      totalNbTasks: {:integer, "u-int32"},
      types: :map,
      writeChannelCongestion: {:union, [:map, :null]}
    ]
  end
end
