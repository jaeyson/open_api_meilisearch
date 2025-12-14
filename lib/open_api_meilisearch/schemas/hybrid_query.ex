defmodule OpenApiMeilisearch.HybridQuery do
  @moduledoc """
  Provides struct and type for a HybridQuery
  """

  @type t :: %__MODULE__{embedder: String.t(), semanticRatio: number | nil}

  defstruct [:embedder, :semanticRatio]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [embedder: :string, semanticRatio: {:number, "float"}]
  end
end
