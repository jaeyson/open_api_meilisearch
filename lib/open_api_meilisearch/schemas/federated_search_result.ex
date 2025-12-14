defmodule OpenApiMeilisearch.FederatedSearchResult do
  @moduledoc """
  Provides struct and type for a FederatedSearchResult
  """

  @type t :: %__MODULE__{
          facetDistribution: map | nil,
          facetStats: map | nil,
          facetsByIndex: map | nil,
          hits: [OpenApiMeilisearch.SearchHit.t()] | nil,
          processingTimeMs: integer | nil,
          remoteErrors: map | nil,
          semanticHitCount: integer | nil
        }

  defstruct [
    :facetDistribution,
    :facetStats,
    :facetsByIndex,
    :hits,
    :processingTimeMs,
    :remoteErrors,
    :semanticHitCount
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      facetDistribution: {:union, [:map, :null]},
      facetStats: {:union, [:map, :null]},
      facetsByIndex: :map,
      hits: [{OpenApiMeilisearch.SearchHit, :t}],
      processingTimeMs: :integer,
      remoteErrors: {:union, [:map, :null]},
      semanticHitCount: {:union, [{:integer, "u-int32"}, :null]}
    ]
  end
end
