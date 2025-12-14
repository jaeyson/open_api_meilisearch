defmodule OpenApiMeilisearch.ChatSearchParams do
  @moduledoc """
  Provides struct and type for a ChatSearchParams
  """

  @type t :: %__MODULE__{
          attributesToSearchOn: [String.t()] | nil,
          distinct: String.t() | nil,
          hybrid: OpenApiMeilisearch.HybridQuery.t() | nil,
          limit: integer | nil,
          matchingStrategy: String.t() | nil,
          rankingScoreThreshold: number | nil,
          sort: [String.t()] | nil
        }

  defstruct [
    :attributesToSearchOn,
    :distinct,
    :hybrid,
    :limit,
    :matchingStrategy,
    :rankingScoreThreshold,
    :sort
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributesToSearchOn: {:union, [[:string], :null]},
      distinct: {:union, [:string, :null]},
      hybrid: {:union, [{OpenApiMeilisearch.HybridQuery, :t}, :null]},
      limit: {:union, [:integer, :null]},
      matchingStrategy: {:union, [{:enum, ["last", "all", "frequency"]}, :null]},
      rankingScoreThreshold: {:union, [{:number, "double"}, :null]},
      sort: {:union, [[:string], :null]}
    ]
  end
end
