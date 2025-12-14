defmodule OpenApiMeilisearch.Federation do
  @moduledoc """
  Provides struct and type for a Federation
  """

  @type t :: %__MODULE__{
          facetsByIndex: map,
          limit: integer,
          mergeFacets: OpenApiMeilisearch.MergeFacets.t() | nil,
          offset: integer
        }

  defstruct [:facetsByIndex, :limit, :mergeFacets, :offset]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      facetsByIndex: :map,
      limit: :integer,
      mergeFacets: {:union, [{OpenApiMeilisearch.MergeFacets, :t}, :null]},
      offset: :integer
    ]
  end
end
