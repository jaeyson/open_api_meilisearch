defmodule OpenApiMeilisearch.IndexCreateRequest do
  @moduledoc """
  Provides struct and type for a IndexCreateRequest
  """

  @type t :: %__MODULE__{primaryKey: String.t() | nil, uid: String.t()}

  defstruct [:primaryKey, :uid]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [primaryKey: {:union, [:string, :null]}, uid: :string]
  end
end
