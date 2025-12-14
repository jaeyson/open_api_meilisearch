defmodule OpenApiMeilisearch.PatchApiKey do
  @moduledoc """
  Provides struct and type for a PatchApiKey
  """

  @type t :: %__MODULE__{description: String.t() | nil, name: String.t() | nil}

  defstruct [:description, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [description: {:union, [:string, :null]}, name: {:union, [:string, :null]}]
  end
end
