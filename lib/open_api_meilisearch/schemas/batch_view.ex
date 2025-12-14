defmodule OpenApiMeilisearch.BatchView do
  @moduledoc """
  Provides struct and type for a BatchView
  """

  @type t :: %__MODULE__{
          batchStrategy: String.t() | nil,
          details: OpenApiMeilisearch.DetailsView.t(),
          duration: String.t() | nil,
          finishedAt: DateTime.t() | nil,
          progress: OpenApiMeilisearch.ProgressView.t() | nil,
          startedAt: DateTime.t() | nil,
          stats: OpenApiMeilisearch.BatchStats.t(),
          uid: integer
        }

  defstruct [
    :batchStrategy,
    :details,
    :duration,
    :finishedAt,
    :progress,
    :startedAt,
    :stats,
    :uid
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      batchStrategy: :string,
      details: {OpenApiMeilisearch.DetailsView, :t},
      duration: {:union, [:string, :null]},
      finishedAt: {:union, [{:string, "date-time"}, :null]},
      progress: {:union, [{OpenApiMeilisearch.ProgressView, :t}, :null]},
      startedAt: {:string, "date-time"},
      stats: {OpenApiMeilisearch.BatchStats, :t},
      uid: {:integer, "u-int32"}
    ]
  end
end
