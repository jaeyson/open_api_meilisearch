defmodule OpenApiMeilisearch.AllBatches do
  @moduledoc """
  Provides struct and type for a AllBatches
  """

  @type t :: %__MODULE__{
          from: integer | nil,
          limit: integer,
          next: integer | nil,
          results: [OpenApiMeilisearch.BatchView.t()],
          total: integer
        }

  defstruct [:from, :limit, :next, :results, :total]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      from: {:union, [{:integer, "u-int32"}, :null]},
      limit: {:integer, "u-int32"},
      next: {:union, [{:integer, "u-int32"}, :null]},
      results: [{OpenApiMeilisearch.BatchView, :t}],
      total: {:integer, "u-int64"}
    ]
  end
end
