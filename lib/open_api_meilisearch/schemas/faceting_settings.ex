defmodule OpenApiMeilisearch.FacetingSettings do
  @moduledoc """
  Provides struct and type for a FacetingSettings
  """

  @type t :: %__MODULE__{maxValuesPerFacet: integer | nil, sortFacetValuesBy: map | nil}

  defstruct [:maxValuesPerFacet, :sortFacetValuesBy]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [maxValuesPerFacet: {:union, [:integer, :null]}, sortFacetValuesBy: {:union, [:map, :null]}]
  end
end
