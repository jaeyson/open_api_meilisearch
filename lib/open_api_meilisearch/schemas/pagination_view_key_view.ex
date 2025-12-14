defmodule OpenApiMeilisearch.PaginationViewKeyView do
  @moduledoc """
  Provides struct and type for a PaginationViewKeyView
  """

  @type t :: %__MODULE__{
          limit: integer,
          offset: integer,
          results: [OpenApiMeilisearch.PaginationViewKeyViewResults.t()],
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
      results: [{OpenApiMeilisearch.PaginationViewKeyViewResults, :t}],
      total: :integer
    ]
  end
end
