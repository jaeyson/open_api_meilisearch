defmodule OpenApiMeilisearch.UpdateIndexRequest do
  @moduledoc """
  Provides struct and type for a UpdateIndexRequest
  """

  @type t :: %__MODULE__{primaryKey: String.t() | nil}

  defstruct [:primaryKey]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [primaryKey: {:union, [:string, :null]}]
  end
end
