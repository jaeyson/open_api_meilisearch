defmodule OpenApiMeilisearch.PaginationViewValue do
  @moduledoc """
  Provides struct and type for a PaginationViewValue
  """

  @type t :: %__MODULE__{limit: integer, offset: integer, results: [map], total: integer}

  defstruct [:limit, :offset, :results, :total]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [limit: :integer, offset: :integer, results: [:map], total: :integer]
  end
end
