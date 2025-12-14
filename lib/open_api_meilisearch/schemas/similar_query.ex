defmodule OpenApiMeilisearch.SimilarQuery do
  @moduledoc """
  Provides struct and type for a SimilarQuery
  """

  @type t :: %__MODULE__{
          attributes_to_retrieve: [String.t()] | nil,
          embedder: String.t(),
          filter: map | nil,
          id: String.t(),
          limit: integer,
          offset: integer,
          ranking_score_threshold: number,
          retrieve_vectors: boolean,
          show_ranking_score: boolean,
          show_ranking_score_details: boolean
        }

  defstruct [
    :attributes_to_retrieve,
    :embedder,
    :filter,
    :id,
    :limit,
    :offset,
    :ranking_score_threshold,
    :retrieve_vectors,
    :show_ranking_score,
    :show_ranking_score_details
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes_to_retrieve: {:union, [[:string], :null]},
      embedder: :string,
      filter: :map,
      id: :string,
      limit: :integer,
      offset: :integer,
      ranking_score_threshold: {:number, "double"},
      retrieve_vectors: :boolean,
      show_ranking_score: :boolean,
      show_ranking_score_details: :boolean
    ]
  end
end
