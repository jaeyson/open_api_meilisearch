defmodule OpenApiMeilisearch.PaginationViewIndexViewResults do
  @moduledoc """
  Provides struct and type for a PaginationViewIndexViewResults
  """

  @type t :: %__MODULE__{
          createdAt: DateTime.t(),
          primaryKey: String.t() | nil,
          uid: String.t(),
          updatedAt: DateTime.t()
        }

  defstruct [:createdAt, :primaryKey, :uid, :updatedAt]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      createdAt: {:string, "date-time"},
      primaryKey: {:union, [:string, :null]},
      uid: :string,
      updatedAt: {:string, "date-time"}
    ]
  end
end
