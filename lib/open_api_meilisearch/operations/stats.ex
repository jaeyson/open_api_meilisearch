defmodule OpenApiMeilisearch.Stats do
  @moduledoc """
  Provides API endpoints related to stats
  """

  @default_client OpenApiMeilisearch.Client

  @doc """
  Get stats of index

  Get the stats of an index.
  """
  @spec get_index_stats(indexUid :: String.t(), opts :: keyword) ::
          {:ok, OpenApiMeilisearch.IndexStats.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def get_index_stats(indexUid, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid],
      call: {OpenApiMeilisearch.Stats, :get_index_stats},
      url: "/indexes/#{indexUid}/stats",
      method: :get,
      response: [
        {200, {OpenApiMeilisearch.IndexStats, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}},
        {404, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get prometheus metrics

  Retrieve metrics on the engine. See https://www.meilisearch.com/docs/learn/experimental/metrics
  Currently, [the feature is experimental](https://www.meilisearch.com/docs/learn/experimental/overview)
  which means it must be enabled.
  """
  @spec get_metrics(opts :: keyword) ::
          {:ok, String.t()} | {:error, OpenApiMeilisearch.ResponseError.t()}
  def get_metrics(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {OpenApiMeilisearch.Stats, :get_metrics},
      url: "/metrics",
      method: :get,
      response: [{200, :string}, {401, {OpenApiMeilisearch.ResponseError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get stats of all indexes.

  Get stats of all indexes.
  """
  @spec get_stats(opts :: keyword) ::
          {:ok, OpenApiMeilisearch.Stats.t()} | {:error, OpenApiMeilisearch.ResponseError.t()}
  def get_stats(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {OpenApiMeilisearch.Stats, :get_stats},
      url: "/stats",
      method: :get,
      response: [
        {200, {OpenApiMeilisearch.Stats, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @type t :: %__MODULE__{
          databaseSize: integer,
          indexes: map,
          lastUpdate: DateTime.t() | nil,
          usedDatabaseSize: integer
        }

  defstruct [:databaseSize, :indexes, :lastUpdate, :usedDatabaseSize]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      databaseSize: {:integer, "u-int64"},
      indexes: :map,
      lastUpdate: {:union, [{:string, "date-time"}, :null]},
      usedDatabaseSize: {:integer, "u-int64"}
    ]
  end
end
