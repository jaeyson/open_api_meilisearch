defmodule OpenApiMeilisearch.PaginationSettings do
  @moduledoc """
  Provides struct and type for a PaginationSettings
  """

  @type t :: %__MODULE__{maxTotalHits: integer | nil}

  defstruct [:maxTotalHits]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [maxTotalHits: {:union, [:integer, :null]}]
  end
end
