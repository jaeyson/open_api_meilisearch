defmodule OpenApiMeilisearch.MergeFacets do
  @moduledoc """
  Provides struct and type for a MergeFacets
  """

  @type t :: %__MODULE__{maxValuesPerFacet: integer | nil}

  defstruct [:maxValuesPerFacet]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [maxValuesPerFacet: {:union, [:integer, :null]}]
  end
end
