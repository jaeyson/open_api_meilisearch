defmodule OpenApiMeilisearch.SearchResult do
  @moduledoc """
  Provides struct and type for a SearchResult
  """

  @type t :: %__MODULE__{
          facetDistribution: map | nil,
          facetStats: map | nil,
          hits: [OpenApiMeilisearch.SearchHit.t()] | nil,
          processingTimeMs: integer | nil,
          query: String.t() | nil,
          semanticHitCount: integer | nil
        }

  defstruct [:facetDistribution, :facetStats, :hits, :processingTimeMs, :query, :semanticHitCount]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      facetDistribution: {:union, [:map, :null]},
      facetStats: {:union, [:map, :null]},
      hits: [{OpenApiMeilisearch.SearchHit, :t}],
      processingTimeMs: :integer,
      query: :string,
      semanticHitCount: {:union, [{:integer, "u-int32"}, :null]}
    ]
  end
end
