defmodule OpenApiMeilisearch.FilterFeatures do
  @moduledoc """
  Provides struct and type for a FilterFeatures
  """

  @type t :: %__MODULE__{comparison: boolean | nil, equality: boolean | nil}

  defstruct [:comparison, :equality]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [comparison: :boolean, equality: :boolean]
  end
end
