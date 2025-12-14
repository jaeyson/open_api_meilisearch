defmodule OpenApiMeilisearch.IndexStats do
  @moduledoc """
  Provides struct and type for a IndexStats
  """

  @type t :: %__MODULE__{
          avgDocumentSize: integer,
          fieldDistribution: map,
          isIndexing: boolean,
          numberOfDocuments: integer,
          numberOfEmbeddedDocuments: integer | nil,
          numberOfEmbeddings: integer | nil,
          rawDocumentDbSize: integer
        }

  defstruct [
    :avgDocumentSize,
    :fieldDistribution,
    :isIndexing,
    :numberOfDocuments,
    :numberOfEmbeddedDocuments,
    :numberOfEmbeddings,
    :rawDocumentDbSize
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      avgDocumentSize: {:integer, "u-int64"},
      fieldDistribution: :map,
      isIndexing: :boolean,
      numberOfDocuments: {:integer, "u-int64"},
      numberOfEmbeddedDocuments: {:union, [{:integer, "u-int64"}, :null]},
      numberOfEmbeddings: {:union, [{:integer, "u-int64"}, :null]},
      rawDocumentDbSize: {:integer, "u-int64"}
    ]
  end
end
