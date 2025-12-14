defmodule OpenApiMeilisearch.PaginationViewIndexView do
  @moduledoc """
  Provides struct and type for a PaginationViewIndexView
  """

  @type t :: %__MODULE__{
          limit: integer,
          offset: integer,
          results: [OpenApiMeilisearch.PaginationViewIndexViewResults.t()],
          total: integer
        }

  defstruct [:limit, :offset, :results, :total]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      limit: :integer,
      offset: :integer,
      results: [{OpenApiMeilisearch.PaginationViewIndexViewResults, :t}],
      total: :integer
    ]
  end
end
