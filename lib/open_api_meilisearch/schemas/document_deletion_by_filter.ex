defmodule OpenApiMeilisearch.DocumentDeletionByFilter do
  @moduledoc """
  Provides struct and type for a DocumentDeletionByFilter
  """

  @type t :: %__MODULE__{filter: map}

  defstruct [:filter]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [filter: :map]
  end
end
