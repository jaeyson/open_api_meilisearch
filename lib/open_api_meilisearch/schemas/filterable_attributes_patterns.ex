defmodule OpenApiMeilisearch.FilterableAttributesPatterns do
  @moduledoc """
  Provides struct and type for a FilterableAttributesPatterns
  """

  @type t :: %__MODULE__{
          attributePatterns: OpenApiMeilisearch.AttributePatterns.t(),
          features: OpenApiMeilisearch.FilterableAttributesFeatures.t() | nil
        }

  defstruct [:attributePatterns, :features]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributePatterns: {OpenApiMeilisearch.AttributePatterns, :t},
      features: {OpenApiMeilisearch.FilterableAttributesFeatures, :t}
    ]
  end
end
