defmodule OpenApiMeilisearch.SearchHit do
  @moduledoc """
  Provides struct and type for a SearchHit
  """

  @type t :: %__MODULE__{
          _formatted: map | nil,
          _matchesPosition: map | nil,
          _rankingScore: number | nil,
          _rankingScoreDetails: map | nil
        }

  defstruct [:_formatted, :_matchesPosition, :_rankingScore, :_rankingScoreDetails]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _formatted: :map,
      _matchesPosition: {:union, [:map, :null]},
      _rankingScore: {:union, [{:number, "double"}, :null]},
      _rankingScoreDetails: {:union, [:map, :null]}
    ]
  end
end
