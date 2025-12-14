defmodule OpenApiMeilisearch.AttributePatterns do
  @moduledoc """
  Provides struct and type for a AttributePatterns
  """

  @type t :: %__MODULE__{patterns: [String.t()]}

  defstruct [:patterns]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [patterns: [:string]]
  end
end
