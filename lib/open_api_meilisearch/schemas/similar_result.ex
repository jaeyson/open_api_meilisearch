defmodule OpenApiMeilisearch.SimilarResult do
  @moduledoc """
  Provides struct and type for a SimilarResult
  """

  @type t :: %__MODULE__{
          hits: [OpenApiMeilisearch.SearchHit.t()] | nil,
          id: String.t() | nil,
          processingTimeMs: integer | nil
        }

  defstruct [:hits, :id, :processingTimeMs]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [hits: [{OpenApiMeilisearch.SearchHit, :t}], id: :string, processingTimeMs: :integer]
  end
end
