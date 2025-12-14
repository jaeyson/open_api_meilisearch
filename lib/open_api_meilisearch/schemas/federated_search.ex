defmodule OpenApiMeilisearch.FederatedSearch do
  @moduledoc """
  Provides struct and type for a FederatedSearch
  """

  @type t :: %__MODULE__{
          federation: OpenApiMeilisearch.Federation.t() | nil,
          queries: [OpenApiMeilisearch.SearchQueryWithIndex.t()]
        }

  defstruct [:federation, :queries]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      federation: {:union, [{OpenApiMeilisearch.Federation, :t}, :null]},
      queries: [{OpenApiMeilisearch.SearchQueryWithIndex, :t}]
    ]
  end
end
