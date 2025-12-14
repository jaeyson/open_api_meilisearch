defmodule OpenApiMeilisearch.ChatSettings do
  @moduledoc """
  Provides struct and type for a ChatSettings
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          documentTemplate: String.t() | nil,
          documentTemplateMaxBytes: integer | nil,
          searchParameters: OpenApiMeilisearch.ChatSearchParams.t() | nil
        }

  defstruct [:description, :documentTemplate, :documentTemplateMaxBytes, :searchParameters]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:union, [:string, :null]},
      documentTemplate: {:union, [:string, :null]},
      documentTemplateMaxBytes: {:union, [:integer, :null]},
      searchParameters: {:union, [{OpenApiMeilisearch.ChatSearchParams, :t}, :null]}
    ]
  end
end
