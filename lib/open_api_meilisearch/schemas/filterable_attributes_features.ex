defmodule OpenApiMeilisearch.FilterableAttributesFeatures do
  @moduledoc """
  Provides struct and type for a FilterableAttributesFeatures
  """

  @type t :: %__MODULE__{
          facetSearch: boolean | nil,
          filter: OpenApiMeilisearch.FilterFeatures.t() | nil
        }

  defstruct [:facetSearch, :filter]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [facetSearch: :boolean, filter: {OpenApiMeilisearch.FilterFeatures, :t}]
  end
end
