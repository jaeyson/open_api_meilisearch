defmodule OpenApiMeilisearch.FederationOptions do
  @moduledoc """
  Provides struct and type for a FederationOptions
  """

  @type t :: %__MODULE__{queryPosition: integer | nil, remote: String.t() | nil, weight: number}

  defstruct [:queryPosition, :remote, :weight]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      queryPosition: {:union, [:integer, :null]},
      remote: {:union, [:string, :null]},
      weight: {:number, "double"}
    ]
  end
end
