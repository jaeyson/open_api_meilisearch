defmodule OpenApiMeilisearch.DocumentEditionByFunction do
  @moduledoc """
  Provides struct and type for a DocumentEditionByFunction
  """

  @type t :: %__MODULE__{context: map | nil, filter: map | nil, function: String.t()}

  defstruct [:context, :filter, :function]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [context: :map, filter: :map, function: :string]
  end
end
