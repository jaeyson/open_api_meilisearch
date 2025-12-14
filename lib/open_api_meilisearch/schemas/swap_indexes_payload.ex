defmodule OpenApiMeilisearch.SwapIndexesPayload do
  @moduledoc """
  Provides struct and type for a SwapIndexesPayload
  """

  @type t :: %__MODULE__{indexes: [String.t()]}

  defstruct [:indexes]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [indexes: [:string]]
  end
end
